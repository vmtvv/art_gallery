import 'package:art_gallery/api/api.dart';
import 'package:chopper/chopper.dart';

part 'art_collection_service.chopper.dart';

@ChopperApi(baseUrl: "/collection")
abstract class ArtCollectionService extends ChopperService {
  static ArtCollectionService create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$ArtCollectionService(client);
    }

    final newClient = ChopperClient(
        services: [_$ArtCollectionService()],
        converter: JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
    return _$ArtCollectionService(newClient);
  }

  Future<Response<ArtCollection>> getArtCollection(
      {required String involvedMaker}) {
    clientMappings.putIfAbsent(
        ArtCollection, () => ArtCollection.fromJsonFactory);

    return _getArtCollection(involvedMaker: involvedMaker);
  }

  @Get()
  Future<Response<ArtCollection>> _getArtCollection(
      {@Query() required String involvedMaker});
}
