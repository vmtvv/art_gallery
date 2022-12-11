part of 'art_details_bloc.dart';

class ArtDetailsState extends Equatable {
  const ArtDetailsState({
    required this.status,
    this.selectedNumber,
    this.artObjectDetails,
  });

  final ArtDetailsStatus status;
  final String? selectedNumber;
  final ArtObjectDetails? artObjectDetails;

  ArtDetailsState copyWith({
    ArtDetailsStatus? status,
    String? selectedNumber,
    ArtObjectDetails? artObjectDetails,
  }) {
    return ArtDetailsState(
      status: status ?? this.status,
      selectedNumber: selectedNumber ?? this.selectedNumber,
      artObjectDetails: artObjectDetails ?? this.artObjectDetails,
    );
  }

  @override
  List<Object?> get props => [status, selectedNumber, artObjectDetails];
}
