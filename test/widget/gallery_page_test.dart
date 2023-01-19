import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'helpers/helpers.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionRepository extends Mock
    implements domain.ArtCollectionRepository {}

class MockGalleryBloc extends MockBloc<GalleryEvent, GalleryState>
    implements GalleryBloc {}

class MockGalleryFilterBloc
    extends MockBloc<GalleryFilterEvent, GalleryFilterState>
    implements GalleryFilterBloc {}

class MockArtDetailsBloc extends MockBloc<ArtDetailsEvent, ArtDetailsState>
    implements ArtDetailsBloc {}

void main() {
  late AppLogger appLogger;
  late domain.ArtCollectionRepository artCollectionRepository;
  late GalleryBloc galleryBloc;
  late GalleryFilterBloc galleryFilterBloc;

  setUp(() {
    appLogger = MockAppLogger();
    artCollectionRepository = MockArtCollectionRepository();
    galleryBloc = MockGalleryBloc();
    galleryFilterBloc = MockGalleryFilterBloc();

    when(() => galleryBloc.state)
        .thenReturn(const GalleryState(status: GalleryStatus.success));
    when(() => galleryFilterBloc.state).thenReturn(
        const GalleryFilterState(status: GalleryFilterStatus.clean));
  });

  group('GalleryPage', () {
    final mockArtObjects = [
      domain.ArtObject(
        'id_test_1',
        'number_test_1',
        'Test Item 1',
        'Long Test Title',
        null,
        null,
        'Test Maker',
      ),
      domain.ArtObject(
        'id_test_2',
        'number_test_2',
        'Test Item 2',
        'Long Test Title',
        null,
        null,
        'Test Maker',
      ),
    ];

    Widget buildSubject() {
      return MultiProvider(
        providers: [
          Provider.value(value: appLogger),
          RepositoryProvider.value(value: artCollectionRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: galleryBloc),
            BlocProvider.value(value: galleryFilterBloc)
          ],
          child: wrapWithMaterialApp(const GalleryPage()),
        ),
      );
    }

    testWidgets('renders GalleryFilterChips', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(GalleryFilterChips), findsOneWidget);
    });

    testWidgets('does not display GalleryFilterPicker by default',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(GalleryFilterPicker), findsNothing);
    });

    testWidgets('displays GalleryFilterPicker when click on the filter button',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.tap(
        find.descendant(
          of: find.byType(GalleryFilterChips),
          matching: find.byType(ActionChip),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(GalleryFilterPicker), findsOneWidget);
    });

    testWidgets('renders ActivityIndicator for GalleryStatus.initial',
        (tester) async {
      when(() => galleryBloc.state).thenReturn(
        const GalleryState(status: GalleryStatus.initial),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ActivityIndicator), findsOneWidget);
    });

    testWidgets('renders GalleryList for GalleryStatus.success',
        (tester) async {
      when(() => galleryBloc.state).thenReturn(
        GalleryState(
          status: GalleryStatus.success,
          artObjects: mockArtObjects,
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(GalleryList), findsOneWidget);
    });

    testWidgets('renders RetryView for GalleryStatus.failure', (tester) async {
      when(() => galleryBloc.state).thenReturn(
        const GalleryState(status: GalleryStatus.failure),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(RetryView), findsOneWidget);
    });
  });
}
