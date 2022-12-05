import 'package:art_gallery/api/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtObject {
  ArtObject({
    required this.id,
    required this.objectNumber,
    required this.title,
    this.headerImage,
    required this.principalOrFirstMaker,
  });

  factory ArtObject.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'objectNumber')
  final String objectNumber;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'headerImage')
  final Image? headerImage;
  @JsonKey(name: 'principalOrFirstMaker')
  final String principalOrFirstMaker;

  static const fromJsonFactory = _$ArtObjectFromJson;
  static const toJsonFactory = _$ArtObjectToJson;

  Map<String, dynamic> toJson() => _$ArtObjectToJson(this);
}
