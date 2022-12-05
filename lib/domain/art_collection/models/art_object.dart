import 'package:art_gallery/domain/art_collection/models/models.dart';

class ArtObject {
  final String id;
  final String number;
  final String title;
  final Image? image;
  final String principalOrFirstMaker;

  ArtObject(
      this.id, this.number, this.title, this.image, this.principalOrFirstMaker);
}
