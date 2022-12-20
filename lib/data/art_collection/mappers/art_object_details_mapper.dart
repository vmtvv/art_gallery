import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtObjectDetailsMapper on data.ArtObjectDetails {
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
