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
      {required int century, String? involvedMaker}) async {
    try {
      final response = await service.getArtCollection(
          century: century, involvedMaker: involvedMaker);
      _handleResponse(response);
      final collection = response.body!;
      return collection.toDomain();
    } on Exception catch (e) {
      _handleException(e,
          'Unable to get collection of century $century and maker $involvedMaker.');
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
    } on Exception catch (e) {
      _handleException(
          e, 'Unable to retrieve art object details of number $objectNumber.');
      rethrow;
    }
  }

  void _handleException(Exception exception, String errorMessage) {
    var message = '$errorMessage\nReason: $exception';
    logger.e(() => message);
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
