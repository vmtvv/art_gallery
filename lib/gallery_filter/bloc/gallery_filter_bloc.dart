import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/domain/art_collection/models/art_collection_century.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_filter_event.dart';
part 'gallery_filter_state.dart';

enum GalleryFilterStatus { clean, changed, applied }

class GalleryFilterBloc extends Bloc<GalleryFilterEvent, GalleryFilterState> {
  GalleryFilterBloc({
    required GalleryBloc galleryBloc,
    ArtCollectionCentury? initialCentury,
    String? initialMaker,
  })  : _galleryBloc = galleryBloc,
        super(GalleryFilterState(
          status: GalleryFilterStatus.clean,
          century: initialCentury,
          involvedMaker: initialMaker,
        )) {
    on<GalleryFilterInitializationRequested>(
        _onGalleryFilterInitializationRequested);
    on<GalleryFilterCenturyChanged>(_onGalleryFilterCenturyChanged);
    on<GalleryFilterInvolvedMakerChanged>(_onGalleryFilterInvolvedMakerChanged);
    on<GalleryFilterApplied>(_onGalleryFilterApplied);
  }

  final GalleryBloc _galleryBloc;

  void _onGalleryFilterInitializationRequested(
    GalleryFilterInitializationRequested event,
    Emitter<GalleryFilterState> emit,
  ) {
    emit(
      GalleryFilterState(
        status: GalleryFilterStatus.clean,
        century: _galleryBloc.state.filter.century,
        involvedMaker: _galleryBloc.state.filter.involvedMaker,
      ),
    );
  }

  void _onGalleryFilterCenturyChanged(
    GalleryFilterCenturyChanged event,
    Emitter<GalleryFilterState> emit,
  ) {
    emit(
      GalleryFilterState(
        status: GalleryFilterStatus.changed,
        century: event.century,
        involvedMaker: state.involvedMaker,
      ),
    );
  }

  void _onGalleryFilterInvolvedMakerChanged(
    GalleryFilterInvolvedMakerChanged event,
    Emitter<GalleryFilterState> emit,
  ) {
    final involvedMaker =
        event.involvedMaker?.isEmpty ?? false ? null : event.involvedMaker;
    emit(
      GalleryFilterState(
        status: GalleryFilterStatus.changed,
        century: state.century,
        involvedMaker: involvedMaker,
      ),
    );
  }

  void _onGalleryFilterApplied(
    GalleryFilterApplied event,
    Emitter<GalleryFilterState> emit,
  ) {
    emit(
      state.copyWith(
        status: GalleryFilterStatus.applied,
      ),
    );
    _galleryBloc.add(GalleryFilterChanged(
      filter: ArtCollectionFilter(
        century: state.century,
        involvedMaker: state.involvedMaker,
      ),
    ));
  }
}
