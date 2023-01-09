part of 'gallery_filter_bloc.dart';

class GalleryFilterState extends Equatable {
  const GalleryFilterState({
    required this.status,
    this.century,
    this.involvedMaker,
  });

  final GalleryFilterStatus status;
  final ArtCollectionCentury? century;
  final String? involvedMaker;

  GalleryFilterState copyWith({
    GalleryFilterStatus? status,
    ArtCollectionCentury? century,
    String? involvedMaker,
  }) {
    return GalleryFilterState(
      status: status ?? this.status,
      century: century ?? this.century,
      involvedMaker: involvedMaker ?? this.involvedMaker,
    );
  }

  @override
  List<Object?> get props => [status, century, involvedMaker];
}
