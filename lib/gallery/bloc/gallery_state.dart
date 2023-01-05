part of 'gallery_bloc.dart';

class GalleryState extends Equatable {
  const GalleryState({
    required this.status,
    this.artObjects = const <ArtObject>[],
    this.maxCount = 0,
    this.page = 0,
    this.filter = const ArtCollectionFilter(),
  });

  final GalleryStatus status;
  final List<ArtObject> artObjects;
  final int maxCount;
  final int page;
  final ArtCollectionFilter filter;

  GalleryState copyWith({
    GalleryStatus? status,
    List<ArtObject>? artObjects,
    int? maxCount,
    int? page,
    ArtCollectionFilter? filter,
  }) {
    return GalleryState(
      status: status ?? this.status,
      artObjects: artObjects ?? this.artObjects,
      maxCount: maxCount ?? this.maxCount,
      page: page ?? this.page,
      filter: filter ?? this.filter,
    );
  }

  bool get hasReachedMax => artObjects.length == maxCount;

  @override
  List<Object?> get props => [
        status,
        artObjects,
        maxCount,
        page,
        filter,
      ];
}
