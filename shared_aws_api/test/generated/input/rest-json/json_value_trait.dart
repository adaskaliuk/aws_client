// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'json_value_trait.g.dart';

/// JSON value trait
class JSONValueTrait {
  final _s.RestJsonProtocol _protocol;
  JSONValueTrait({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'JSONValueTrait',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField?.let((v) => headers['X-Amz-Foo'] = v.toString());
    var _query = '';
    _query = '?${[
      if (queryField != null) _s.toQueryParam('Bar', queryField),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: body,
      headers: headers,
      method: 'POST',
      requestUri: '/$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField?.let((v) => headers['X-Amz-Foo'] = v.toString());
    var _query = '';
    _query = '?${[
      if (queryField != null) _s.toQueryParam('Bar', queryField),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: body,
      headers: headers,
      method: 'POST',
      requestUri: '/$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField?.let((v) => headers['X-Amz-Foo'] = v.toString());
    var _query = '';
    _query = '?${[
      if (queryField != null) _s.toQueryParam('Bar', queryField),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: body,
      headers: headers,
      method: 'POST',
      requestUri: '/$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BodyStructure {
  @_s.JsonKey(name: 'BodyField')
  final String bodyField;
  @_s.JsonKey(name: 'BodyListField')
  final List<String> bodyListField;

  BodyStructure({
    this.bodyField,
    this.bodyListField,
  });
  Map<String, dynamic> toJson() => _$BodyStructureToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
