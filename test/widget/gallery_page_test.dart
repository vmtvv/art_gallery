import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'helpers/helpers.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionRepository extends Mock
    implements domain.ArtCollectionRepository {}

class MockGalleryBloc extends MockBloc<GalleryEvent, GalleryState>
    implements GalleryBloc {}

class MockArtDetailsBloc extends MockBloc<ArtDetailsEvent, ArtDetailsState>
    implements ArtDetailsBloc {}

void main() {
  late AppLogger appLogger;
  late domain.ArtCollectionRepository artCollectionRepository;
  late GalleryBloc galleryBloc;

  setUp(() {
    appLogger = MockAppLogger();
    artCollectionRepository = MockArtCollectionRepository();
    galleryBloc = MockGalleryBloc();
  });

  group('GalleryPage', () {
    testWidgets('renders GalleryView', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider.value(value: appLogger),
            RepositoryProvider.value(value: artCollectionRepository),
          ],
          child: wrapWithMaterialApp(const GalleryPage()),
        ),
      );
      expect(find.byType(GalleryView), findsOneWidget);
    });
  });

  group('GalleryView', () {
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
      return BlocProvider.value(
        value: galleryBloc,
        child: wrapWithMaterialApp(
          const GalleryView(),
        ),
      );
    }

    testWidgets('renders ActivityIndicator for GalleryStatus.initial',
        (tester) async {
      when(() => galleryBloc.state)
          .thenReturn(const GalleryState(status: GalleryStatus.initial));
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
        const GalleryState(
          status: GalleryStatus.failure,
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(RetryView), findsOneWidget);
    });
  });
}
