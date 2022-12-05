import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/api/art_collection/mappers/mappers.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';

extension ArtCollectionMapper on api.ArtCollection {
  domain.ArtCollection toDomain() {
    return domain.ArtCollection(
      count.selfOrDefault(),
      artObjects.map((e) => e.toDomain()).toList(),
    );
  }
}
