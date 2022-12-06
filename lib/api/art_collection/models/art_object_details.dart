import 'package:art_gallery/api/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtObjectDetails {
  ArtObjectDetails(
      {required this.id,
      required this.objectNumber,
      required this.title,
      required this.subTitle,
      required this.longTitle,
      this.webImage,
      required this.principalMaker,
      required this.description,
      required this.plaqueDescription,
      required this.objectTypes,
      required this.materials});

  factory ArtObjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectDetailsFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'objectNumber')
  final String objectNumber;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'subTitle')
  final String subTitle;
  @JsonKey(name: 'longTitle')
  final String longTitle;
  @JsonKey(name: 'webImage')
  final Image? webImage;
  @JsonKey(name: 'principalOrFirstMaker')
  final String principalMaker;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'plaqueDescriptionEnglish')
  final String plaqueDescription;
  @JsonKey(name: 'objectTypes', defaultValue: <String>[])
  final List<String> objectTypes;
  @JsonKey(name: 'materials', defaultValue: <String>[])
  final List<String> materials;

  static const fromJsonFactory = _$ArtObjectDetailsFromJson;
  static const toJsonFactory = _$ArtObjectDetailsToJson;

  Map<String, dynamic> toJson() => _$ArtObjectDetailsToJson(this);
}
