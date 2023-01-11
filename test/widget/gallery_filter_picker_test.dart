import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/helpers.dart';

class MockGalleryFilterBloc
    extends MockBloc<GalleryFilterEvent, GalleryFilterState>
    implements GalleryFilterBloc {}

void main() {
  late GalleryFilterBloc galleryFilterBloc;

  setUp(() {
    galleryFilterBloc = MockGalleryFilterBloc();
  });

  group('GalleryFilterPicker', () {
    Widget buildSubject() {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: galleryFilterBloc),
        ],
        child: wrapWithMaterialApp(
          GalleryFilterPicker(onClose: () {}),
        ),
      );
    }

    testWidgets('renders input fields', (tester) async {
      when(() => galleryFilterBloc.state).thenReturn(
          const GalleryFilterState(status: GalleryFilterStatus.clean));
      await tester.pumpWidget(buildSubject());
      expect(find.byType(InvolvedMakerInput), findsOneWidget);
      expect(find.byType(CenturyInput), findsOneWidget);
      expect(find.byType(HasImageSelector), findsOneWidget);
    });

    /*testWidgets('displays selected values', (tester) async {
      final mockGalleryFilterState = GalleryFilterState(
        status: GalleryFilterStatus.clean,
        century: artCollectionCenturies.first,
        involvedMaker: 'Test',
      );
      when(() => galleryFilterBloc.state).thenReturn(mockGalleryFilterState);
      await tester.pumpWidget(buildSubject());

      expect(find.text(mockGalleryFilterState.involvedMaker!), findsOneWidget);
      expect(find.text(mockGalleryFilterState.century!.name), findsOneWidget);

      final hasImageCheckbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(hasImageCheckbox.value, false);
    });*/
  });
}
