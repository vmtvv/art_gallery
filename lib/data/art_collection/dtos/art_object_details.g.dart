// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjectDetails _$ArtObjectDetailsFromJson(Map<String, dynamic> json) =>
    ArtObjectDetails(
      json['id'] as String,
      json['objectNumber'] as String,
      json['title'] as String? ?? '',
      json['subTitle'] as String? ?? '',
      json['longTitle'] as String? ?? '',
      json['webImage'] == null
          ? null
          : Image.fromJson(json['webImage'] as Map<String, dynamic>),
      json['principalOrFirstMaker'] as String? ?? '',
      json['description'] as String? ?? '',
      json['plaqueDescriptionEnglish'] as String? ?? '',
      (json['objectTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      (json['materials'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );

Map<String, dynamic> _$ArtObjectDetailsToJson(ArtObjectDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'longTitle': instance.longTitle,
      'webImage': instance.webImage?.toJson(),
      'principalOrFirstMaker': instance.principalMaker,
      'description': instance.description,
      'plaqueDescriptionEnglish': instance.plaqueDescription,
      'objectTypes': instance.objectTypes,
      'materials': instance.materials,
    };
