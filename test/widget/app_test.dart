import 'package:art_gallery/app.dart';
import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionRepository extends Mock
    implements ArtCollectionRepository {}

void main() {
  group('App', () {
    late AppLogger appLogger;
    late ArtCollectionRepository artCollectionRepository;

    setUp(() {
      appLogger = MockAppLogger();
      artCollectionRepository = MockArtCollectionRepository();
    });

    testWidgets('renders GalleryPage by default', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider.value(value: appLogger),
            RepositoryProvider.value(value: artCollectionRepository),
          ],
          child: const App(),
        ),
      );
      expect(find.byType(GalleryPage), findsOneWidget);
    });
  });
}
