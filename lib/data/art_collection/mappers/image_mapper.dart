import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/domain/domain.dart' as domain;

extension ImageMapper on data.Image {
  domain.Image toDomain() {
    return domain.Image(
      width,
      height,
      url,
    );
  }
}
