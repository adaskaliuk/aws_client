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

/// Boolean in querystring
class BooleanInQuerystring {
  final _s.RestJsonProtocol _protocol;
  BooleanInQuerystring({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'BooleanInQuerystring',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    bool boolQuery,
  }) async {
    var _query = '';
    _query = '?${[
      if (boolQuery != null) _s.toQueryParam('bool-query', boolQuery),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    bool boolQuery,
  }) async {
    var _query = '';
    _query = '?${[
      if (boolQuery != null) _s.toQueryParam('bool-query', boolQuery),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
