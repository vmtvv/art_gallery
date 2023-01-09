part of 'gallery_filter_bloc.dart';

abstract class GalleryFilterEvent extends Equatable {
  const GalleryFilterEvent();

  @override
  List<Object?> get props => [];
}

class GalleryFilterCenturyChanged extends GalleryFilterEvent {
  const GalleryFilterCenturyChanged(this.century);

  final ArtCollectionCentury? century;

  @override
  List<Object?> get props => [century];
}

class GalleryFilterInvolvedMakerChanged extends GalleryFilterEvent {
  const GalleryFilterInvolvedMakerChanged(this.involvedMaker);

  final String? involvedMaker;

  @override
  List<Object?> get props => [involvedMaker];
}

class GalleryFilterHasImageChanged extends GalleryFilterEvent {
  const GalleryFilterHasImageChanged(this.hasImage);

  final bool hasImage;

  @override
  List<Object?> get props => [hasImage];
}

class GalleryFilterInitializationRequested extends GalleryFilterEvent {
  const GalleryFilterInitializationRequested();
}

class GalleryFilterApplied extends GalleryFilterEvent {
  const GalleryFilterApplied();
}
