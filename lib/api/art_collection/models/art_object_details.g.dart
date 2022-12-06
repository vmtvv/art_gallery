// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjectDetails _$ArtObjectDetailsFromJson(Map<String, dynamic> json) =>
    ArtObjectDetails(
      id: json['id'] as String,
      objectNumber: json['objectNumber'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      longTitle: json['longTitle'] as String,
      webImage: json['webImage'] == null
          ? null
          : Image.fromJson(json['webImage'] as Map<String, dynamic>),
      principalMaker: json['principalOrFirstMaker'] as String,
      description: json['description'] as String,
      plaqueDescription: json['plaqueDescriptionEnglish'] as String,
      objectTypes: (json['objectTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
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
