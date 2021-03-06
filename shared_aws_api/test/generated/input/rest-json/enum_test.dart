// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'enum.dart';

void main() {
  test('Enum 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"FooEnum": "foo", "ListEnums": ["foo", "", "bar"]}'''));
      expect(request.headers['x-amz-enum'], 'baz');
      expect(pathAndQuery(request.url), '/path?Enum=bar&List=0&List=1&List=');
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      fooEnum: EnumType.foo,
      headerEnum: EnumType.baz,
      listEnums: ["foo", "", "bar"],
      queryFooEnum: EnumType.bar,
      queryListEnums: ["0", "1", ""],
    );
/*
{
  "HeaderEnum": "baz",
  "FooEnum": "foo",
  "QueryFooEnum": "bar",
  "ListEnums": [
    "foo",
    "",
    "bar"
  ],
  "QueryListEnums": [
    "0",
    "1",
    ""
  ]
}
*/
  });

  test('Enum 1', () async {
    final client = MockClient((request) async {
      expect(pathAndQuery(request.url), '/path');
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1();
/*
{}
*/
  });
}
