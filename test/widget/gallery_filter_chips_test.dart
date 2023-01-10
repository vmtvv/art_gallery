import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/helpers.dart';

class MockGalleryBloc extends MockBloc<GalleryEvent, GalleryState>
    implements GalleryBloc {}

void main() {
  late GalleryBloc galleryBloc;

  setUp(() {
    galleryBloc = MockGalleryBloc();
  });

  group('GalleryFilterChips', () {
    Widget buildSubject() {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: galleryBloc),
        ],
        child: wrapWithMaterialApp(
          GalleryFilterChips(onFilterPickerToggle: () {}),
        ),
      );
    }

    testWidgets('renders ActionChip as filter button by default',
        (tester) async {
      when(() => galleryBloc.state)
          .thenReturn(const GalleryState(status: GalleryStatus.initial));
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ActionChip), findsOneWidget);
    });

    testWidgets('renders InputChip for applied involved maker filter parameter',
        (tester) async {
      const involvedMaker = 'Vincent van Gogh';
      when(() => galleryBloc.state).thenReturn(
        const GalleryState(
          status: GalleryStatus.success,
          filter: ArtCollectionFilter(involvedMaker: involvedMaker),
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(
        find.descendant(
          of: find.byType(InputChip),
          matching: find.text(involvedMaker),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders InputChip for applied century filter parameter',
        (tester) async {
      final century = ArtCollectionCentury(10, 'X');
      when(() => galleryBloc.state).thenReturn(
        GalleryState(
          status: GalleryStatus.success,
          filter: ArtCollectionFilter(century: century),
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(
        find.descendant(
          of: find.byType(InputChip),
          matching: find.text(century.name),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders InputChip when has image filter parameter is true',
        (tester) async {
      when(() => galleryBloc.state).thenReturn(
        const GalleryState(
          status: GalleryStatus.success,
          filter: ArtCollectionFilter(imgOnly: true),
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(InputChip), findsOneWidget);
    });

    testWidgets('renders three InputChips when all filter parameters applied',
        (tester) async {
      final mockFilter = ArtCollectionFilter(
        involvedMaker: 'Test',
        century: ArtCollectionCentury(20, 'XX'),
        imgOnly: true,
      );
      when(() => galleryBloc.state).thenReturn(
        GalleryState(
          status: GalleryStatus.success,
          filter: mockFilter,
        ),
      );
      await tester.pumpWidget(buildSubject());
      expect(find.byType(InputChip), findsNWidgets(3));
    });
  });
}
