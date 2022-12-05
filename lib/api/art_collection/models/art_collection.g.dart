// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtCollection _$ArtCollectionFromJson(Map<String, dynamic> json) =>
    ArtCollection(
      json['count'] as int,
      (json['artObjects'] as List<dynamic>?)
              ?.map((e) => ArtObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ArtCollectionToJson(ArtCollection instance) =>
    <String, dynamic>{
      'count': instance.count,
      'artObjects': instance.artObjects.map((e) => e.toJson()).toList(),
    };
