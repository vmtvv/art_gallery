import 'dart:async';

import 'package:art_gallery/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'art_details_event.dart';
part 'art_details_state.dart';

enum ArtDetailsStatus { unknown, failed, loading, loaded }

class ArtDetailsBloc extends Bloc<ArtDetailsEvent, ArtDetailsState> {
  ArtDetailsBloc({required ArtCollectionRepository artCollectionRepository})
      : _artCollectionRepository = artCollectionRepository,
        super(const ArtDetailsState.unknown()) {
    on<ArtDetailsNumberSelected>(_onArtDetailsNumberSelected);
  }
  final ArtCollectionRepository _artCollectionRepository;

  Future<void> _onArtDetailsNumberSelected(
    ArtDetailsNumberSelected event,
    Emitter<ArtDetailsState> emit,
  ) async {
    try {
      emit(const ArtDetailsState.loading());
      final artObjectDetails = await _tryGetArtDetails(number: event.number);
      return emit(ArtDetailsState.loaded(artObjectDetails!));
    } catch (_) {
      emit(const ArtDetailsState.failed());
    }
  }

  Future<ArtObjectDetails?> _tryGetArtDetails({required String number}) async {
    final artObjectDetails = await _artCollectionRepository.getArtObjectDetails(
        objectNumber: number);
    return artObjectDetails;
  }
}
