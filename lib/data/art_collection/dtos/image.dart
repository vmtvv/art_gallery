import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(explicitToJson: true)
class Image {
  Image(this.width, this.height, this.url);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @JsonKey(name: 'width', defaultValue: 0)
  final num width;
  @JsonKey(name: 'height', defaultValue: 0)
  final num height;
  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  static const fromJsonFactory = _$ImageFromJson;
  static const toJsonFactory = _$ImageToJson;

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
