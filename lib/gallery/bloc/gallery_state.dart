part of 'gallery_bloc.dart';

class GalleryState extends Equatable {
  const GalleryState._({required this.status, this.artCollection});

  final GalleryStatus status;
  final ArtCollection? artCollection;

  const GalleryState.unknown() : this._(status: GalleryStatus.unknown);

  const GalleryState.failed() : this._(status: GalleryStatus.failed);

  const GalleryState.loading() : this._(status: GalleryStatus.loading);

  const GalleryState.loaded(ArtCollection artCollection)
      : this._(status: GalleryStatus.loaded, artCollection: artCollection);

  @override
  List<Object?> get props => [status, artCollection];
}
