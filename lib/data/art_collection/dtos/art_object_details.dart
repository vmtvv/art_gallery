import 'package:art_gallery/data/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtObjectDetails {
  ArtObjectDetails(
    this.id,
    this.objectNumber,
    this.title,
    this.subTitle,
    this.longTitle,
    this.webImage,
    this.principalMaker,
    this.description,
    this.plaqueDescription,
    this.objectTypes,
    this.materials,
  );

  factory ArtObjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectDetailsFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'objectNumber')
  final String objectNumber;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'subTitle', defaultValue: '')
  final String subTitle;
  @JsonKey(name: 'longTitle', defaultValue: '')
  final String longTitle;
  @JsonKey(name: 'webImage')
  final Image? webImage;
  @JsonKey(name: 'principalOrFirstMaker', defaultValue: '')
  final String principalMaker;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'plaqueDescriptionEnglish', defaultValue: '')
  final String plaqueDescription;
  @JsonKey(name: 'objectTypes', defaultValue: <String>[])
  final List<String> objectTypes;
  @JsonKey(name: 'materials', defaultValue: <String>[])
  final List<String> materials;

  static const fromJsonFactory = _$ArtObjectDetailsFromJson;
  static const toJsonFactory = _$ArtObjectDetailsToJson;

  Map<String, dynamic> toJson() => _$ArtObjectDetailsToJson(this);
}
