import 'dart:async';

import 'package:art_gallery/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

enum GalleryStatus { unknown, failed, loading, loaded }

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required ArtCollectionRepository artCollectionRepository})
      : _artCollectionRepository = artCollectionRepository,
        super(const GalleryState.unknown()) {
    on<GalleryCenturySelected>(_onGalleryCenturySelected);
  }
  final ArtCollectionRepository _artCollectionRepository;

  @override
  Future<void> close() {
    _artCollectionRepository.dispose();
    return super.close();
  }

  Future<void> _onGalleryCenturySelected(
    GalleryCenturySelected event,
    Emitter<GalleryState> emit,
  ) async {
    try {
      emit(const GalleryState.loading());
      final artCollection = await _getArtCollection(century: event.century);
      emit(GalleryState.loaded(artCollection));
    } catch (_) {
      emit(const GalleryState.failed());
    }
  }

  Future<ArtCollection> _getArtCollection({required int century}) async {
    final artCollection =
        await _artCollectionRepository.getCollection(century: century);
    return artCollection;
  }
}
