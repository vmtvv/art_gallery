part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class GalleryCenturySelected extends GalleryEvent {
  const GalleryCenturySelected(this.century);

  final int century;

  @override
  List<Object> get props => [century];
}

class GalleryFetched extends GalleryEvent {}
