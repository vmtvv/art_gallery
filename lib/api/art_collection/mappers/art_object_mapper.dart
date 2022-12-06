import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/api/art_collection/mappers/mappers.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';

extension ArtObjectMapper on api.ArtObject {
  domain.ArtObject toDomain() {
    return domain.ArtObject(
        id.selfOrEmpty(),
        objectNumber.selfOrEmpty(),
        title.selfOrEmpty(),
        longTitle.selfOrEmpty(),
        webImage?.toDomain(),
        headerImage?.toDomain(),
        principalOrFirstMaker.selfOrEmpty());
  }
}
