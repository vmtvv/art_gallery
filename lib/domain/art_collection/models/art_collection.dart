import 'package:art_gallery/domain/art_collection/models/models.dart';

class ArtCollection {
  ArtCollection(this.count, this.artObjects);

  final int count;
  final List<ArtObject> artObjects;
}
