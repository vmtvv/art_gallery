import 'package:art_gallery/api/api.dart' as api;
import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/domain/exceptions/operation_failed_exception.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:chopper/chopper.dart';

class ArtCollectionRepository {
  final api.ArtCollectionService service;
  final AppLogger logger;

  ArtCollectionRepository(this.service, this.logger);

  Future<ArtCollection> getCollection(
      {int? century,
      String? involvedMaker,
      int? page,
      int? countPerPage}) async {
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

  Future<ArtObjectDetails> getArtObjectDetails(
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

  void dispose() {
    service.client.dispose();
  }

  void _handleResponse(Response response) {
    if (!response.isSuccessful) {
      throw OperationFailedException(response.error?.toString());
    }
  }
}
