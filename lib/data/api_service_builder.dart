import 'package:art_gallery/app_configuration.dart';
import 'package:art_gallery/data/data.dart';
import 'package:chopper/chopper.dart';

class ApiServiceBuilder {
  static ArtCollectionService createArtCollectionService() {
    return ArtCollectionService.create(
      baseUrl: AppConfiguration.apiUrl,
      interceptors: {_addKeyInterceptor},
    );
  }

  static Request _addKeyInterceptor(Request request) {
    final parameters = Map.of(request.parameters)
      ..putIfAbsent('key', () => AppConfiguration.apiKey);
    return request.copyWith(parameters: parameters);
  }
}
