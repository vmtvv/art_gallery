import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/api/art_collection/mappers/mappers.dart';
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtCollectionMapper on api.ArtCollection {
  domain.ArtCollection toDomain() {
    return domain.ArtCollection(
      count,
      artObjects.map((e) => e.toDomain()).toList(),
    );
  }
}
