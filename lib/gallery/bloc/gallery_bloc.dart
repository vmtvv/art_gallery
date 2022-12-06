import 'dart:async';

import 'package:art_gallery/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

enum GalleryStatus { unknown, loading, loaded }

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
    emit(const GalleryState.loading());
    final artCollection = await _tryGetArtCollection(century: event.century);
    return emit(GalleryState.loaded(artCollection!));
  }

  Future<ArtCollection?> _tryGetArtCollection({required int century}) async {
    try {
      final artCollection =
          await _artCollectionRepository.getCollection(century: century);
      return artCollection;
    } catch (_) {
      return null;
    }
  }
}
