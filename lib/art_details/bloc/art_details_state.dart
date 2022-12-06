part of 'art_details_bloc.dart';

class ArtDetailsState extends Equatable {
  const ArtDetailsState._({
    required this.status,
    this.artObjectDetails,
  });

  final ArtDetailsStatus status;
  final ArtObjectDetails? artObjectDetails;

  const ArtDetailsState.unknown() : this._(status: ArtDetailsStatus.unknown);

  const ArtDetailsState.loading() : this._(status: ArtDetailsStatus.loading);

  const ArtDetailsState.loaded(ArtObjectDetails artObjectDetails)
      : this._(
            status: ArtDetailsStatus.loaded,
            artObjectDetails: artObjectDetails);

  @override
  List<Object?> get props => [status, artObjectDetails];
}
