import 'package:art_gallery/api/api.dart';
import 'package:chopper/chopper.dart';

class ApiServiceBuilder {
  static const String _culture = 'en';
  static const String _baseUrl = 'https://www.rijksmuseum.nl/api/$_culture';
  static const String _apiKey = '[api_key]';

  static ArtCollectionService createArtCollectionService() {
    return ArtCollectionService.create(
      baseUrl: _baseUrl,
      interceptors: {_addKeyInterceptor},
    );
  }

  static Request _addKeyInterceptor(Request request) {
    final parameters = Map.of(request.parameters)
      ..putIfAbsent('key', () => _apiKey);
    return request.copyWith(parameters: parameters);
  }
}
