import 'dart:async';

import 'package:art_gallery/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'art_details_event.dart';
part 'art_details_state.dart';

enum ArtDetailsStatus { initial, failure, success }

class ArtDetailsBloc extends Bloc<ArtDetailsEvent, ArtDetailsState> {
  ArtDetailsBloc({required ArtCollectionRepository artCollectionRepository})
      : _artCollectionRepository = artCollectionRepository,
        super(const ArtDetailsState(status: ArtDetailsStatus.initial)) {
    on<ArtDetailsNumberSelected>(_onArtDetailsNumberSelected);
  }
  final ArtCollectionRepository _artCollectionRepository;

  Future<void> _onArtDetailsNumberSelected(
    ArtDetailsNumberSelected event,
    Emitter<ArtDetailsState> emit,
  ) async {
    try {
      final artObjectDetails = await _tryGetArtDetails(number: event.number);

      return emit(
        state.copyWith(
          status: ArtDetailsStatus.success,
          selectedNumber: event.number,
          artObjectDetails: artObjectDetails,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ArtDetailsStatus.failure));
    }
  }

  Future<ArtObjectDetails?> _tryGetArtDetails({required String number}) async {
    final artObjectDetails = await _artCollectionRepository.getArtObjectDetails(
        objectNumber: number);
    return artObjectDetails;
  }
}
