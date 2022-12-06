// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_collection_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ArtCollectionService extends ArtCollectionService {
  _$ArtCollectionService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ArtCollectionService;

  @override
  Future<Response<ArtCollection>> _getArtCollection({
    required int century,
    String? involvedMaker,
  }) {
    final $url = '/collection';
    final $params = <String, dynamic>{
      'f.dating.period': century,
      'involvedMaker': involvedMaker,
    };
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ArtCollection, ArtCollection>($request);
  }
}
