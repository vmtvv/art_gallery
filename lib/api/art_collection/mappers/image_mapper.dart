import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';

extension ImageMapper on api.Image {
  domain.Image toDomain() {
    return domain.Image(
      width.selfOrDefault(),
      height.selfOrDefault(),
      url.selfOrEmpty(),
    );
  }
}
