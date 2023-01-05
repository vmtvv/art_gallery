part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class GalleryFetched extends GalleryEvent {
  const GalleryFetched();
}

class GalleryFilterChanged extends GalleryEvent {
  const GalleryFilterChanged({required this.filter});

  final ArtCollectionFilter filter;

  @override
  List<Object?> get props => [filter];
}
