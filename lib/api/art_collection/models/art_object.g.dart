// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObject _$ArtObjectFromJson(Map<String, dynamic> json) => ArtObject(
      id: json['id'] as String,
      objectNumber: json['objectNumber'] as String,
      title: json['title'] as String,
      headerImage: json['headerImage'] == null
          ? null
          : Image.fromJson(json['headerImage'] as Map<String, dynamic>),
      principalOrFirstMaker: json['principalOrFirstMaker'] as String,
    );

Map<String, dynamic> _$ArtObjectToJson(ArtObject instance) => <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'headerImage': instance.headerImage?.toJson(),
      'principalOrFirstMaker': instance.principalOrFirstMaker,
    };
