import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/api/art_collection/mappers/mappers.dart';
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtObjectDetailsMapper on api.ArtObjectDetails {
  domain.ArtObjectDetails toDomain() {
    return domain.ArtObjectDetails(
        id,
        objectNumber,
        title,
        subTitle,
        longTitle,
        webImage?.toDomain(),
        principalMaker,
        description,
        plaqueDescription,
        objectTypes,
        materials);
  }
}
