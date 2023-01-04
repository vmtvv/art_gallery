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
  const GalleryFilterChanged({
    this.century,
    this.involvedMaker,
  });

  final int? century;
  final String? involvedMaker;

  @override
  List<Object?> get props => [century, involvedMaker];
}
