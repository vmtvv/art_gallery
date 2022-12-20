import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:chopper/chopper.dart';

class ArtCollectionRepository implements domain.ArtCollectionRepository {
  final data.ArtCollectionService service;
  final AppLogger logger;

  ArtCollectionRepository(this.service, this.logger);

  @override
  Future<domain.ArtCollection> getCollection({
    int? century,
    String? involvedMaker,
    int? page,
    int? countPerPage,
  }) async {
    try {
      final response = await service.getArtCollection(
        century: century,
        involvedMaker: involvedMaker,
        page: page,
        countPerPage: countPerPage,
      );
      _handleResponse(response);
      final collection = response.body!;
      return collection.toDomain();
    } catch (e, s) {
      logger.e(
          () =>
              'Unable to get collection of century $century and maker $involvedMaker.',
          e,
          s);
      rethrow;
    }
  }

  @override
  Future<domain.ArtObjectDetails> getArtObjectDetails(
      {required String objectNumber}) async {
    try {
      final response =
          await service.getArtObjectDetails(objectNumber: objectNumber);
      _handleResponse(response);
      final artObjectDetails = response.body!.artObjectDetails;
      return artObjectDetails.toDomain();
    } catch (e, s) {
      logger.e(
          () =>
              'Unable to retrieve art object details of number $objectNumber.',
          e,
          s);
      rethrow;
    }
  }

  @override
  void dispose() {
    service.client.dispose();
  }

  void _handleResponse(Response response) {
    if (!response.isSuccessful) {
      throw domain.OperationFailedException(response.error?.toString());
    }
  }
}
