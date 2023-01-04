part of 'gallery_bloc.dart';

class GalleryState extends Equatable {
  const GalleryState({
    required this.status,
    this.century,
    this.involvedMaker,
    this.artObjects = const <ArtObject>[],
    this.maxCount = 0,
    this.page = 0,
    this.sorting,
    this.imgOnly = false,
  });

  final GalleryStatus status;
  final int? century;
  final String? involvedMaker;
  final List<ArtObject> artObjects;
  final int maxCount;
  final int page;
  final ArtCollectionSorting? sorting;
  final bool imgOnly;

  GalleryState copyWith({
    GalleryStatus? status,
    int? century,
    String? involvedMaker,
    List<ArtObject>? artObjects,
    int? maxCount,
    int? page,
    ArtCollectionSorting? sorting,
    bool? imgOnly,
  }) {
    return GalleryState(
      status: status ?? this.status,
      century: century ?? this.century,
      involvedMaker: involvedMaker ?? this.involvedMaker,
      artObjects: artObjects ?? this.artObjects,
      maxCount: maxCount ?? this.maxCount,
      page: page ?? this.page,
      sorting: sorting ?? this.sorting,
      imgOnly: imgOnly ?? this.imgOnly,
    );
  }

  bool get hasReachedMax => artObjects.length == maxCount;

  @override
  List<Object?> get props => [
        status,
        century,
        involvedMaker,
        artObjects,
        page,
        sorting,
        imgOnly,
      ];
}
