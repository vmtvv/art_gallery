part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class GalleryStatusChanged extends GalleryEvent {
  const GalleryStatusChanged(this.status);

  final GalleryStatus status;

  @override
  List<Object> get props => [status];
}

class GalleryCenturySelected extends GalleryEvent {
  const GalleryCenturySelected(this.century);

  final int century;

  @override
  List<Object> get props => [century];
}
