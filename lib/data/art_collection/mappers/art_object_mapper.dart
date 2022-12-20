import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/domain/domain.dart' as domain;

extension ArtObjectMapper on data.ArtObject {
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
