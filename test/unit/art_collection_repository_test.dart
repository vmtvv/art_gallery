import 'package:art_gallery/api/art_collection/art_collection.dart' as api;
import 'package:art_gallery/domain/art_collection/art_collection.dart'
    as domain;
import 'package:art_gallery/domain/exceptions/operation_failed_exception.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLogger extends Mock implements AppLogger {}

class MockArtCollectionService extends Mock
    implements api.ArtCollectionService {}

class MockResponse<BodyType> extends Mock implements Response<BodyType> {}

void main() {
  group('ArtCollectionRepository unit tests', () {
    late AppLogger appLogger;
    late api.ArtCollectionService artCollectionService;
    late domain.ArtCollectionRepository artCollectionRepository;

    setUp(() {
      appLogger = MockAppLogger();
      artCollectionService = MockArtCollectionService();
      artCollectionRepository =
          domain.ArtCollectionRepository(artCollectionService, appLogger);
    });

    test('Returns art collection', () async {
      final response = MockResponse<api.ArtCollection>();
      when(() => response.isSuccessful).thenReturn(true);
      when(() => response.body).thenReturn(api.ArtCollection(10, []));
      when(() => artCollectionService.getArtCollection())
          .thenAnswer((_) => Future.value(response));

      expect(await artCollectionRepository.getCollection(),
          isA<domain.ArtCollection>());
    });

    test('Returns art object details', () async {
      const artObjectNumber = "test-1-test";
      final response = MockResponse<api.ArtObjectDetailsResponse>();
      final artObjectDetailsResponse = api.ArtObjectDetailsResponse(
        api.ArtObjectDetails(
          'test-id-1',
          'test-number-1',
          'Test Object Details',
          'Test subtitle',
          'Test long title of test object',
          null,
          'Test Principal Maker',
          'This is the test description',
          'This is plaque description for the art object details',
          ['Test Type'],
          ['Test Material'],
        ),
      );

      when(() => response.isSuccessful).thenReturn(true);
      when(() => response.body).thenReturn(artObjectDetailsResponse);
      when(() => artCollectionService.getArtObjectDetails(
              objectNumber: artObjectNumber))
          .thenAnswer((_) => Future.value(response));

      expect(
          await artCollectionRepository.getArtObjectDetails(
              objectNumber: artObjectNumber),
          isA<domain.ArtObjectDetails>());
    });

    test('Handles failed art collection response', () {
      final response = MockResponse<api.ArtCollection>();

      when(() => response.isSuccessful).thenReturn(false);
      when(() => response.error).thenReturn('I am an error!');
      when(() => artCollectionService.getArtCollection())
          .thenAnswer((_) => Future.value(response));

      expect(
        artCollectionRepository.getCollection(),
        throwsA(isA<OperationFailedException>()),
      );
    });

    test('Handles failed art object details response', () {
      const artObjectNumber = "test-2-test";
      final response = MockResponse<api.ArtObjectDetailsResponse>();

      when(() => response.isSuccessful).thenReturn(false);
      when(() => response.error).thenReturn('I am an error!');
      when(() => artCollectionService.getArtObjectDetails(
              objectNumber: artObjectNumber))
          .thenAnswer((_) => Future.value(response));

      expect(
        artCollectionRepository.getArtObjectDetails(
            objectNumber: artObjectNumber),
        throwsA(isA<OperationFailedException>()),
      );
    });
  });
}
