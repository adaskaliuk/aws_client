// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'nested_blobs.dart';

void main() {
  test('Nested blobs 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"ListParam": ["Zm9v", "YmFy"]}'''));
      expect(
          request.headers['X-Amz-Target'], 'com.amazonaws.foo.OperationName');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = NestedBlobs(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      listParam: [
        Uint8List.fromList('foo'.codeUnits),
        Uint8List.fromList('bar'.codeUnits)
      ],
    );
/*
{
  "ListParam": [
    "foo",
    "bar"
  ]
}
*/
  });
}
