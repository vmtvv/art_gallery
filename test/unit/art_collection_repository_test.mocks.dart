// Mocks generated by Mockito 5.3.2 from annotations
// in art_gallery/test/unit/art_collection_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i8;

import 'package:art_gallery/api/api.dart' as _i3;
import 'package:art_gallery/shared/logging/app_logger.dart' as _i5;
import 'package:chopper/chopper.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'art_collection_repository_test.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeChopperClient_0 extends _i1.SmartFake implements _i2.ChopperClient {
  _FakeChopperClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeType_1 extends _i1.SmartFake implements Type {
  _FakeType_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<BodyType> extends _i1.SmartFake
    implements _i2.Response<BodyType> {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeArtObjectDetails_3 extends _i1.SmartFake
    implements _i3.ArtObjectDetails {
  _FakeArtObjectDetails_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseResponse_4 extends _i1.SmartFake implements _i4.BaseResponse {
  _FakeBaseResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppLogger].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppLogger extends _i1.Mock implements _i5.AppLogger {
  @override
  void v(String Function()? message) => super.noSuchMethod(
        Invocation.method(
          #v,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void d(String Function()? message) => super.noSuchMethod(
        Invocation.method(
          #d,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void i(String Function()? message) => super.noSuchMethod(
        Invocation.method(
          #i,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void w(String Function()? message) => super.noSuchMethod(
        Invocation.method(
          #w,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void e(
    String Function()? message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #e,
          [
            message,
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void wtf(String Function()? message) => super.noSuchMethod(
        Invocation.method(
          #wtf,
          [message],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ArtCollectionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockArtCollectionService extends _i1.Mock
    implements _i3.ArtCollectionService {
  @override
  _i2.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeChopperClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeChopperClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.ChopperClient);
  @override
  set client(_i2.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_1(
          this,
          Invocation.getter(#definitionType),
        ),
        returnValueForMissingStub: _FakeType_1(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);
  @override
  _i6.Future<_i2.Response<_i3.ArtCollection>> getArtCollection({
    int? century,
    String? involvedMaker,
    int? page,
    int? countPerPage,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArtCollection,
          [],
          {
            #century: century,
            #involvedMaker: involvedMaker,
            #page: page,
            #countPerPage: countPerPage,
          },
        ),
        returnValue: _i6.Future<_i2.Response<_i3.ArtCollection>>.value(
            _FakeResponse_2<_i3.ArtCollection>(
          this,
          Invocation.method(
            #getArtCollection,
            [],
            {
              #century: century,
              #involvedMaker: involvedMaker,
              #page: page,
              #countPerPage: countPerPage,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Response<_i3.ArtCollection>>.value(
                _FakeResponse_2<_i3.ArtCollection>(
          this,
          Invocation.method(
            #getArtCollection,
            [],
            {
              #century: century,
              #involvedMaker: involvedMaker,
              #page: page,
              #countPerPage: countPerPage,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<_i3.ArtCollection>>);
  @override
  _i6.Future<_i2.Response<_i3.ArtObjectDetailsResponse>> getArtObjectDetails(
          {required String? objectNumber}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArtObjectDetails,
          [],
          {#objectNumber: objectNumber},
        ),
        returnValue:
            _i6.Future<_i2.Response<_i3.ArtObjectDetailsResponse>>.value(
                _FakeResponse_2<_i3.ArtObjectDetailsResponse>(
          this,
          Invocation.method(
            #getArtObjectDetails,
            [],
            {#objectNumber: objectNumber},
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Response<_i3.ArtObjectDetailsResponse>>.value(
                _FakeResponse_2<_i3.ArtObjectDetailsResponse>(
          this,
          Invocation.method(
            #getArtObjectDetails,
            [],
            {#objectNumber: objectNumber},
          ),
        )),
      ) as _i6.Future<_i2.Response<_i3.ArtObjectDetailsResponse>>);
}

/// A class which mocks [ArtObjectDetailsResponse].
///
/// See the documentation for Mockito's code generation for more information.
class MockArtObjectDetailsResponse extends _i1.Mock
    implements _i3.ArtObjectDetailsResponse {
  @override
  _i3.ArtObjectDetails get artObjectDetails => (super.noSuchMethod(
        Invocation.getter(#artObjectDetails),
        returnValue: _FakeArtObjectDetails_3(
          this,
          Invocation.getter(#artObjectDetails),
        ),
        returnValueForMissingStub: _FakeArtObjectDetails_3(
          this,
          Invocation.getter(#artObjectDetails),
        ),
      ) as _i3.ArtObjectDetails);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [ArtObjectDetails].
///
/// See the documentation for Mockito's code generation for more information.
class MockArtObjectDetails extends _i1.Mock implements _i3.ArtObjectDetails {
  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get objectNumber => (super.noSuchMethod(
        Invocation.getter(#objectNumber),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get subTitle => (super.noSuchMethod(
        Invocation.getter(#subTitle),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get longTitle => (super.noSuchMethod(
        Invocation.getter(#longTitle),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get principalMaker => (super.noSuchMethod(
        Invocation.getter(#principalMaker),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get plaqueDescription => (super.noSuchMethod(
        Invocation.getter(#plaqueDescription),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  List<String> get objectTypes => (super.noSuchMethod(
        Invocation.getter(#objectTypes),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);
  @override
  List<String> get materials => (super.noSuchMethod(
        Invocation.getter(#materials),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [Response].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockSuccessfulResponse<BodyType> extends _i1.Mock
    implements _i2.Response<BodyType> {
  @override
  _i4.BaseResponse get base => (super.noSuchMethod(
        Invocation.getter(#base),
        returnValue: _FakeBaseResponse_4(
          this,
          Invocation.getter(#base),
        ),
        returnValueForMissingStub: _FakeBaseResponse_4(
          this,
          Invocation.getter(#base),
        ),
      ) as _i4.BaseResponse);
  @override
  int get statusCode => (super.noSuchMethod(
        Invocation.getter(#statusCode),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  bool get isSuccessful => (super.noSuchMethod(
        Invocation.getter(#isSuccessful),
        returnValue: _i7.success(),
        returnValueForMissingStub: _i7.success(),
      ) as bool);
  @override
  Map<String, String> get headers => (super.noSuchMethod(
        Invocation.getter(#headers),
        returnValue: <String, String>{},
        returnValueForMissingStub: <String, String>{},
      ) as Map<String, String>);
  @override
  _i8.Uint8List get bodyBytes => (super.noSuchMethod(
        Invocation.getter(#bodyBytes),
        returnValue: _i8.Uint8List(0),
        returnValueForMissingStub: _i8.Uint8List(0),
      ) as _i8.Uint8List);
  @override
  String get bodyString => (super.noSuchMethod(
        Invocation.getter(#bodyString),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i2.Response<NewBodyType> copyWith<NewBodyType>({
    _i4.BaseResponse? base,
    NewBodyType? body,
    Object? bodyError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #base: base,
            #body: body,
            #bodyError: bodyError,
          },
        ),
        returnValue: _FakeResponse_2<NewBodyType>(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #base: base,
              #body: body,
              #bodyError: bodyError,
            },
          ),
        ),
        returnValueForMissingStub: _FakeResponse_2<NewBodyType>(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #base: base,
              #body: body,
              #bodyError: bodyError,
            },
          ),
        ),
      ) as _i2.Response<NewBodyType>);
}

/// A class which mocks [Response].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockFailedResponse<BodyType> extends _i1.Mock
    implements _i2.Response<BodyType> {
  @override
  _i4.BaseResponse get base => (super.noSuchMethod(
        Invocation.getter(#base),
        returnValue: _FakeBaseResponse_4(
          this,
          Invocation.getter(#base),
        ),
        returnValueForMissingStub: _FakeBaseResponse_4(
          this,
          Invocation.getter(#base),
        ),
      ) as _i4.BaseResponse);
  @override
  int get statusCode => (super.noSuchMethod(
        Invocation.getter(#statusCode),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  bool get isSuccessful => (super.noSuchMethod(
        Invocation.getter(#isSuccessful),
        returnValue: _i7.failure(),
        returnValueForMissingStub: _i7.failure(),
      ) as bool);
  @override
  Map<String, String> get headers => (super.noSuchMethod(
        Invocation.getter(#headers),
        returnValue: <String, String>{},
        returnValueForMissingStub: <String, String>{},
      ) as Map<String, String>);
  @override
  _i8.Uint8List get bodyBytes => (super.noSuchMethod(
        Invocation.getter(#bodyBytes),
        returnValue: _i8.Uint8List(0),
        returnValueForMissingStub: _i8.Uint8List(0),
      ) as _i8.Uint8List);
  @override
  String get bodyString => (super.noSuchMethod(
        Invocation.getter(#bodyString),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i2.Response<NewBodyType> copyWith<NewBodyType>({
    _i4.BaseResponse? base,
    NewBodyType? body,
    Object? bodyError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #base: base,
            #body: body,
            #bodyError: bodyError,
          },
        ),
        returnValue: _FakeResponse_2<NewBodyType>(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #base: base,
              #body: body,
              #bodyError: bodyError,
            },
          ),
        ),
        returnValueForMissingStub: _FakeResponse_2<NewBodyType>(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #base: base,
              #body: body,
              #bodyError: bodyError,
            },
          ),
        ),
      ) as _i2.Response<NewBodyType>);
}