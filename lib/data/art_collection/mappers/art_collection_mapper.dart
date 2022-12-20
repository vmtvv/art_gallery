import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtCollectionMapper on data.ArtCollection {
  domain.ArtCollection toDomain() {
    return domain.ArtCollection(
      count,
      artObjects.map((e) => e.toDomain()).toList(),
    );
  }
}
