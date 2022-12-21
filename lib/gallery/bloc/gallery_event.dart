part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class GalleryCenturySelected extends GalleryEvent {
  const GalleryCenturySelected({
    required this.century,
    this.sorting,
    this.imgOnly,
  });

  final int century;
  final ArtCollectionSorting? sorting;
  final bool? imgOnly;

  @override
  List<Object?> get props => [century, sorting, imgOnly];
}

class GalleryFetched extends GalleryEvent {}
