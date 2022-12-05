import 'package:art_gallery/api/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_collection.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtCollection {
  ArtCollection(this.count, this.artObjects);

  factory ArtCollection.fromJson(Map<String, dynamic> json) =>
      _$ArtCollectionFromJson(json);

  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'artObjects', defaultValue: <ArtObject>[])
  final List<ArtObject> artObjects;

  static const fromJsonFactory = _$ArtCollectionFromJson;
  static const toJsonFactory = _$ArtCollectionToJson;

  Map<String, dynamic> toJson() => _$ArtCollectionToJson(this);
}
