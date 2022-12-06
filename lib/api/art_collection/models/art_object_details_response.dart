import 'package:art_gallery/api/art_collection/art_collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtObjectDetailsResponse {
  ArtObjectDetailsResponse(this.artObjectDetails);

  factory ArtObjectDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectDetailsResponseFromJson(json);

  @JsonKey(name: 'artObject')
  final ArtObjectDetails artObjectDetails;

  static const fromJsonFactory = _$ArtObjectDetailsResponseFromJson;
  static const toJsonFactory = _$ArtObjectDetailsResponseToJson;

  Map<String, dynamic> toJson() => _$ArtObjectDetailsResponseToJson(this);
}
