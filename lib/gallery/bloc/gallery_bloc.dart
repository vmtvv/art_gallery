import 'dart:async';

import 'package:art_gallery/domain/domain.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

enum GalleryStatus { initial, loading, failure, success }

const _countPerPage = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({
    required ArtCollectionRepository artCollectionRepository,
  })  : _artCollectionRepository = artCollectionRepository,
        super(const GalleryState(status: GalleryStatus.initial)) {
    on<GalleryFilterChanged>(_onGalleryFilterChanged);
    on<GalleryFetched>(
      _onGalleryFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final ArtCollectionRepository _artCollectionRepository;

  @override
  Future<void> close() {
    _artCollectionRepository.dispose();
    return super.close();
  }

  Future<void> _onGalleryFilterChanged(
    GalleryFilterChanged event,
    Emitter<GalleryState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: GalleryStatus.loading,
          filter: event.filter,
        ),
      );
      var page = 1;
      final artCollection = await _getArtCollection(
        century: event.filter.century,
        involvedMaker: event.filter.involvedMaker,
        page: page,
        countPerPage: _countPerPage,
      );
      return emit(
        state.copyWith(
          status: GalleryStatus.success,
          artObjects: artCollection.artObjects,
          maxCount: artCollection.count,
          page: page,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }

  Future<void> _onGalleryFetched(
    GalleryFetched event,
    Emitter<GalleryState> emit,
  ) async {
    try {
      if (state.hasReachedMax) return;
      final page = state.page + 1;
      final artCollection = await _getArtCollection(
        century: state.filter.century,
        involvedMaker: state.filter.involvedMaker,
        page: page,
        countPerPage: _countPerPage,
        sorting: state.filter.sorting,
        imgOnly: state.filter.imgOnly,
      );
      artCollection.artObjects.isEmpty
          ? emit(state.copyWith(page: page))
          : emit(
              state.copyWith(
                status: GalleryStatus.success,
                artObjects: List.of(state.artObjects)
                  ..addAll(artCollection.artObjects),
                page: page,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }

  Future<ArtCollection> _getArtCollection({
    int? century,
    String? involvedMaker,
    int? page,
    int? countPerPage,
    ArtCollectionSorting? sorting,
    bool? imgOnly,
  }) async {
    final artCollection = await _artCollectionRepository.getCollection(
      century: century,
      involvedMaker: involvedMaker,
      page: page,
      countPerPage: countPerPage,
      sorting: sorting,
      imgOnly: imgOnly,
    );
    return artCollection;
  }
}
