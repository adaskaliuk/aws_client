// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'string_payload.dart';

void main() {
  test('String payload 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''bar'''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200, headers: {});
    });

    final service = StringPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      foo: "bar",
    );
/*
{
  "foo": "bar"
}
*/
  });
}
