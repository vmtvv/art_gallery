import 'package:art_gallery/domain/art_collection/models/models.dart';

class ArtObject {
  final String id;
  final String number;
  final String title;
  final String longTitle;
  final Image? image;
  final Image? headerImage;
  final String principalOrFirstMaker;

  ArtObject(this.id, this.number, this.title, this.longTitle, this.image,
      this.headerImage, this.principalOrFirstMaker);
}
