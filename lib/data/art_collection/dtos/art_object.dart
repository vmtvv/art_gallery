import 'package:art_gallery/data/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtObject {
  ArtObject({
    required this.id,
    required this.objectNumber,
    required this.title,
    required this.longTitle,
    this.webImage,
    this.headerImage,
    required this.principalOrFirstMaker,
  });

  factory ArtObject.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'objectNumber')
  final String objectNumber;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'longTitle', defaultValue: '')
  final String longTitle;
  @JsonKey(name: 'webImage')
  final Image? webImage;
  @JsonKey(name: 'headerImage')
  final Image? headerImage;
  @JsonKey(name: 'principalOrFirstMaker', defaultValue: '')
  final String principalOrFirstMaker;

  static const fromJsonFactory = _$ArtObjectFromJson;
  static const toJsonFactory = _$ArtObjectToJson;

  Map<String, dynamic> toJson() => _$ArtObjectToJson(this);
}
