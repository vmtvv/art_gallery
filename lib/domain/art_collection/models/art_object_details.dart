import 'package:art_gallery/domain/art_collection/models/models.dart';

class ArtObjectDetails {
  final String id;
  final String number;
  final String title;
  final String subTitle;
  final String longTitle;
  final Image? image;
  final String principalMaker;
  final String description;
  final String plaqueDescription;
  final List<String> objectTypes;
  final List<String> materials;

  ArtObjectDetails(
      this.id,
      this.number,
      this.title,
      this.subTitle,
      this.longTitle,
      this.image,
      this.principalMaker,
      this.description,
      this.plaqueDescription,
      this.objectTypes,
      this.materials);
}
