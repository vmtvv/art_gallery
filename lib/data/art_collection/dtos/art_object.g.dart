// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObject _$ArtObjectFromJson(Map<String, dynamic> json) => ArtObject(
      id: json['id'] as String,
      objectNumber: json['objectNumber'] as String,
      title: json['title'] as String? ?? '',
      longTitle: json['longTitle'] as String? ?? '',
      webImage: json['webImage'] == null
          ? null
          : Image.fromJson(json['webImage'] as Map<String, dynamic>),
      headerImage: json['headerImage'] == null
          ? null
          : Image.fromJson(json['headerImage'] as Map<String, dynamic>),
      principalOrFirstMaker: json['principalOrFirstMaker'] as String? ?? '',
    );

Map<String, dynamic> _$ArtObjectToJson(ArtObject instance) => <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'longTitle': instance.longTitle,
      'webImage': instance.webImage?.toJson(),
      'headerImage': instance.headerImage?.toJson(),
      'principalOrFirstMaker': instance.principalOrFirstMaker,
    };
