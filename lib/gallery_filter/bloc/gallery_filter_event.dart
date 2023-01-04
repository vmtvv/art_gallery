part of 'gallery_filter_bloc.dart';

abstract class GalleryFilterEvent extends Equatable {
  const GalleryFilterEvent();

  @override
  List<Object?> get props => [];
}

class GalleryFilterCenturyChanged extends GalleryFilterEvent {
  const GalleryFilterCenturyChanged(this.century);

  final int? century;

  @override
  List<Object?> get props => [century];
}

class GalleryFilterInvolvedMakerChanged extends GalleryFilterEvent {
  const GalleryFilterInvolvedMakerChanged(this.involvedMaker);

  final String? involvedMaker;

  @override
  List<Object?> get props => [involvedMaker];
}

class GalleryFilterInitializationRequested extends GalleryFilterEvent {
  const GalleryFilterInitializationRequested();
}

class GalleryFilterCleanupRequested extends GalleryFilterEvent {
  const GalleryFilterCleanupRequested();
}

class GalleryFilterApplied extends GalleryFilterEvent {
  const GalleryFilterApplied();
}
