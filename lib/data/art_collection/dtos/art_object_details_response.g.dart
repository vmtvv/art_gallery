// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjectDetailsResponse _$ArtObjectDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ArtObjectDetailsResponse(
      ArtObjectDetails.fromJson(json['artObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtObjectDetailsResponseToJson(
        ArtObjectDetailsResponse instance) =>
    <String, dynamic>{
      'artObject': instance.artObjectDetails.toJson(),
    };
