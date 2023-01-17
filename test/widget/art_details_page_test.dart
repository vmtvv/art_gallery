import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import 'helpers/helpers.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionRepository extends Mock
    implements domain.ArtCollectionRepository {}

class MockArtDetailsBloc extends MockBloc<ArtDetailsEvent, ArtDetailsState>
    implements ArtDetailsBloc {}

void main() {
  final mockArtObjectDetails = domain.ArtObjectDetails(
    'test-id-1',
    'test-number-1',
    'Test Object Details',
    'Test subtitle',
    'Test long title of test object',
    null,
    'Test Principal Maker',
    'This is the test description',
    'This is plaque description for the art object details',
    ['Test Type'],
    ['Test Material'],
  );

  late AppLogger appLogger;
  late domain.ArtCollectionRepository artCollectionRepository;
  late ArtDetailsBloc artDetailsBloc;

  setUp(() {
    appLogger = MockAppLogger();
    artCollectionRepository = MockArtCollectionRepository();
    artDetailsBloc = MockArtDetailsBloc();

    when(() => artDetailsBloc.state).thenReturn(
      ArtDetailsState(
        status: ArtDetailsStatus.initial,
        selectedNumber: mockArtObjectDetails.number,
        artObjectDetails: mockArtObjectDetails,
      ),
    );
  });

  group('ArtDetailsPage', () {
    Widget buildSubject() {
      final arguments = ArtDetailsArguments(
        title: mockArtObjectDetails.longTitle,
        number: mockArtObjectDetails.number,
      );
      return MultiProvider(
        providers: [
          Provider.value(value: appLogger),
          RepositoryProvider.value(value: artCollectionRepository),
        ],
        child: wrapWithMaterialApp(
          Navigator(
            onGenerateRoute: (_) => ArtDetailsPage.route(arguments: arguments),
          ),
        ),
      );
    }

    testWidgets('renders ArtDetailsView by providing parameters',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ArtDetailsView), findsOneWidget);
    });
  });

  group('ArtDetailsView', () {
    Widget buildSubject() {
      return BlocProvider.value(
        value: artDetailsBloc,
        child: wrapWithMaterialApp(
          const ArtDetailsView(),
        ),
      );
    }

    testWidgets('renders ActivityIndicator for ArtDetailsStatus.initial',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ActivityIndicator), findsOneWidget);
    });

    testWidgets(
        'renders long title, subtitle and plaques description'
        'for ArtDetails.success', (tester) async {
      when(() => artDetailsBloc.state).thenReturn(
        ArtDetailsState(
          status: ArtDetailsStatus.success,
          selectedNumber: mockArtObjectDetails.number,
          artObjectDetails: mockArtObjectDetails,
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.text(mockArtObjectDetails.longTitle), findsOneWidget);
      expect(find.text(mockArtObjectDetails.subTitle), findsOneWidget);
      expect(find.text(mockArtObjectDetails.plaqueDescription), findsOneWidget);
    });

    testWidgets('renders RetryView for ArtDetailsStatus.failure',
        (tester) async {
      when(() => artDetailsBloc.state).thenReturn(
        const ArtDetailsState(
          status: ArtDetailsStatus.failure,
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(RetryView), findsOneWidget);
    });
  });
}
