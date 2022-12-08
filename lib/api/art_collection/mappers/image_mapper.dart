import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/domain/domain.dart' as domain;

extension ImageMapper on api.Image {
  domain.Image toDomain() {
    return domain.Image(
      width,
      height,
      url,
    );
  }
}
