import 'dart:async';

import 'package:art_gallery/data/client_mappings.dart';
import 'package:chopper/chopper.dart' as chopper;

typedef _JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<BodyType>> convertResponse<BodyType, InnerType>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<BodyType>(
        body: $jsonDecoder.decode<InnerType>(jsonRes.body) as BodyType);
  }
}

class _CustomJsonDecoder {
  _CustomJsonDecoder(this.factories);

  final Map<Type, _JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (chopper.isTypeOf<T, Map>()) {
      return entity;
    }

    if (chopper.isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! _JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

final $jsonDecoder = _CustomJsonDecoder(clientMappings);
