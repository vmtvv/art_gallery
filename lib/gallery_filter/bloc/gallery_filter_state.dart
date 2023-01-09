part of 'gallery_filter_bloc.dart';

class GalleryFilterState extends Equatable {
  const GalleryFilterState({
    required this.status,
    this.century,
    this.involvedMaker,
    this.hasImage = false,
  });

  final GalleryFilterStatus status;
  final ArtCollectionCentury? century;
  final String? involvedMaker;
  final bool hasImage;

  GalleryFilterState copyWith({
    GalleryFilterStatus? status,
    ArtCollectionCentury? century,
    String? involvedMaker,
    bool? hasImage,
  }) {
    return GalleryFilterState(
      status: status ?? this.status,
      century: century ?? this.century,
      involvedMaker: involvedMaker ?? this.involvedMaker,
      hasImage: hasImage ?? this.hasImage,
    );
  }

  @override
  List<Object?> get props => [status, century, involvedMaker, hasImage];
}
