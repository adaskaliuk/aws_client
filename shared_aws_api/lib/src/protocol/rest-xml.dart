import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';

import '_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class RestXmlProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentials _credentials;

  RestXmlProtocol._(
    this._client,
    this._endpoint,
    this._credentials,
  );

  factory RestXmlProtocol({
    Client client,
    String service,
    String region,
    String endpointUrl,
    AwsClientCredentials credentials,
  }) {
    client ??= Client();
    final endpoint = Endpoint.forProtocol(
        service: service, region: region, endpointUrl: endpointUrl);
    credentials ??= AwsClientCredentials.resolve();
    ArgumentError.checkNotNull(credentials, 'credentials');
    return RestXmlProtocol._(client, endpoint, credentials);
  }

  Future<RestXmlResponse> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
    String resultWrapper,
  }) async {
    final rq = _buildRequest(method, requestUri, queryParams, payload, headers);
    final rs = await _client.send(rq);
    final body = await rs.stream.bytesToString();
    XmlDocument root;
    if (body?.isNotEmpty == true) {
      root = XmlDocument.parse(body);
    }
    var elem = root?.rootElement;
    if (elem?.name?.local == 'ErrorResponse') {
      final error = elem.findElements('Error').first;
      final type = error.findElements('Type').first.text;
      final code = error.findElements('Code').first.text;
      final message = error.findElements('Message').first.text;
      final fn = exceptionFnMap[code];
      final exception = fn != null
          ? fn(type, message)
          : GenericAwsException(type: type, code: code, message: message);
      throw exception;
    }
    if (resultWrapper != null && elem != null) {
      elem = elem.findElements(resultWrapper).first;
    }
    return RestXmlResponse(rs.headers, elem ?? XmlElement(XmlName('empty')));
  }

  Request _buildRequest(
      String method,
      String requestUri,
      Map<String, String> queryParams,
      dynamic payload,
      Map<String, String> headers) {
    queryParams ??= <String, String>{};

    var uri = Uri.parse('${_endpoint.url}$requestUri');
    if (queryParams.isNotEmpty) {
      uri = uri
          .replace(queryParameters: {...uri.queryParameters, ...queryParams});
    }
    final rq = Request(
      method,
      uri,
    );

    rq.headers.addAll(headers ?? {});

    if (payload is XmlElement) {
      rq.body = payload.toXmlString();
      rq.headers['Content-Type'] = 'application/xml';
    } else if (payload is String) {
      rq.body = payload;
    } else if (payload is Uint8List) {
      rq.bodyBytes = payload;
    } else if (payload != null) {
      throw UnimplementedError(
          'Not implemented payload type: ${payload.runtimeType}');
    }
    // TODO: handle if the API is using different signing
    signAws4HmacSha256(
      rq: rq,
      service: _endpoint.service,
      region: _endpoint.signingRegion,
      credentials: _credentials,
    );
    return rq;
  }
}

class RestXmlResponse {
  final Map<String, String> headers;
  final XmlElement body;

  RestXmlResponse(this.headers, this.body);
}
