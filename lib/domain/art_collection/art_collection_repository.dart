import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/domain/art_collection/art_collection.dart';

class ArtCollectionRepository {
  final api.ArtCollectionService service;

  ArtCollectionRepository(this.service);

  Future<ArtCollection> getCollection(
      {required int century, String? involvedMaker}) async {
    final response = await service.getArtCollection(
        century: century, involvedMaker: involvedMaker);
    final collection = response.body!;
    return collection.toDomain();
  }

  Future<ArtObjectDetails> getArtObjectDetails(
      {required String objectNumber}) async {
    final response =
        await service.getArtObjectDetails(objectNumber: objectNumber);
    final artObjectDetails = response.body!.artObjectDetails;
    return artObjectDetails.toDomain();
  }

  void dispose() {
    service.client.dispose();
  }
}
