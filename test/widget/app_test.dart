import 'package:art_gallery/app.dart';
import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/preferences/preferences.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionRepository extends Mock
    implements ArtCollectionRepository {}

class MockGalleryBloc extends MockBloc<GalleryEvent, GalleryState>
    implements GalleryBloc {}

class MockGalleryFilterBloc
    extends MockBloc<GalleryFilterEvent, GalleryFilterState>
    implements GalleryFilterBloc {}

class MockPreferencesBloc extends MockBloc<PreferencesEvent, PreferencesState>
    implements PreferencesBloc {}

void main() {
  group('App', () {
    late AppLogger appLogger;
    late ArtCollectionRepository artCollectionRepository;
    late PreferencesBloc preferencesBloc;
    late GalleryBloc galleryBloc;
    late GalleryFilterBloc galleryFilterBloc;

    setUp(() {
      appLogger = MockAppLogger();
      artCollectionRepository = MockArtCollectionRepository();
      galleryBloc = MockGalleryBloc();
      galleryFilterBloc = MockGalleryFilterBloc();
      preferencesBloc = MockPreferencesBloc();

      when(() => preferencesBloc.state).thenReturn(PreferencesState(
          isDarkMode: false, theme: AppThemeConfiguration.light));
      when(() => galleryBloc.state)
          .thenReturn(const GalleryState(status: GalleryStatus.success));
      when(() => galleryFilterBloc.state).thenReturn(
          const GalleryFilterState(status: GalleryFilterStatus.clean));
    });

    Widget buildSubject() {
      return MultiProvider(
        providers: [
          Provider.value(value: appLogger),
          RepositoryProvider.value(value: artCollectionRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: preferencesBloc),
            BlocProvider.value(value: galleryBloc),
            BlocProvider.value(value: galleryFilterBloc)
          ],
          child: const App(),
        ),
      );
    }

    testWidgets('renders GalleryPage by default', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(GalleryPage), findsOneWidget);
    });
  });
}
