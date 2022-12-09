import 'package:art_gallery/api/art_collection/art_collection.dart' as api;
import 'package:art_gallery/domain/art_collection/art_collection.dart'
    as domain;
import 'package:art_gallery/domain/exceptions/operation_failed_exception.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<AppLogger>(),
  MockSpec<api.ArtCollectionService>(),
  MockSpec<api.ArtObjectDetailsResponse>(),
  MockSpec<api.ArtObjectDetails>(),
  MockSpec<Response>(
    as: #MockSuccessfulResponse,
    fallbackGenerators: {#isSuccessful: success},
  ),
  MockSpec<Response>(
    as: #MockFailedResponse,
    fallbackGenerators: {#isSuccessful: failure},
  ),
])
import 'art_collection_repository_test.mocks.dart';

bool success() => true;
bool failure() => false;

void main() {
  group('ArtCollectionRepository unit tests', () {
    MockArtCollectionService service = MockArtCollectionService();
    MockAppLogger appLogger = MockAppLogger();
    domain.ArtCollectionRepository repository =
        domain.ArtCollectionRepository(service, appLogger);

    test('Returns art collection', () async {
      final response = MockSuccessfulResponse<api.ArtCollection>();

      when(response.body).thenReturn(api.ArtCollection(10, []));
      when(service.getArtCollection())
          .thenAnswer((_) => Future.value(response));

      expect(await repository.getCollection(), isA<domain.ArtCollection>());
    });

    test('Returns art object details', () async {
      const artObjectNumber = "test-1-test";
      final response = MockSuccessfulResponse<api.ArtObjectDetailsResponse>();
      final artObjectDetailsResponse = MockArtObjectDetailsResponse();

      when(artObjectDetailsResponse.artObjectDetails)
          .thenReturn(MockArtObjectDetails());
      when(response.body).thenReturn(artObjectDetailsResponse);
      when(service.getArtObjectDetails(objectNumber: artObjectNumber))
          .thenAnswer((_) => Future.value(response));

      expect(
          await repository.getArtObjectDetails(objectNumber: artObjectNumber),
          isA<domain.ArtObjectDetails>());
    });

    test('Handles failed art collection response', () {
      final response = MockFailedResponse<api.ArtCollection>();

      when(response.error).thenReturn('I am an error!');
      when(service.getArtCollection())
          .thenAnswer((_) => Future.value(response));

      expect(
        repository.getCollection(),
        throwsA(isA<OperationFailedException>()),
      );
    });

    test('Handles failed art object details response', () {
      const artObjectNumber = "test-2-test";
      final response = MockFailedResponse<api.ArtObjectDetailsResponse>();

      when(response.error).thenReturn('I am an error!');
      when(service.getArtObjectDetails(objectNumber: artObjectNumber))
          .thenAnswer((_) => Future.value(response));

      expect(
        repository.getArtObjectDetails(objectNumber: artObjectNumber),
        throwsA(isA<OperationFailedException>()),
      );
    });
  });
}
