import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/api/art_collection/mappers/mappers.dart';
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtObjectMapper on api.ArtObject {
  domain.ArtObject toDomain() {
    return domain.ArtObject(
      id,
      objectNumber,
      title,
      longTitle,
      webImage?.toDomain(),
      headerImage?.toDomain(),
      principalOrFirstMaker,
    );
  }
}
