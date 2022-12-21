import 'package:art_gallery/data/data.dart';
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

  Future<Response<ArtCollection>> getArtCollection({
    int? century,
    String? involvedMaker,
    int? page,
    int? countPerPage,
    String? sorting,
    bool? imgOnly,
  }) {
    clientMappings.putIfAbsent(
        ArtCollection, () => ArtCollection.fromJsonFactory);

    return _getArtCollection(
      century: century,
      involvedMaker: involvedMaker,
      page: page,
      countPerPage: countPerPage,
      sorting: sorting,
      imgonly: imgOnly,
    );
  }

  @Get()
  Future<Response<ArtCollection>> _getArtCollection({
    @Query('f.dating.period') int? century,
    @Query('involvedMaker') String? involvedMaker,
    @Query('p') int? page,
    @Query('ps') int? countPerPage,
    @Query('s') String? sorting,
    @Query('imgonly') bool? imgonly,
  });

  Future<Response<ArtObjectDetailsResponse>> getArtObjectDetails(
      {required String objectNumber}) {
    clientMappings.putIfAbsent(ArtObjectDetailsResponse,
        () => ArtObjectDetailsResponse.fromJsonFactory);

    return _getArtObjectDetails(objectNumber: objectNumber);
  }

  @Get(path: '/{objectNumber}')
  Future<Response<ArtObjectDetailsResponse>> _getArtObjectDetails(
      {@Path('objectNumber') required String objectNumber});
}
