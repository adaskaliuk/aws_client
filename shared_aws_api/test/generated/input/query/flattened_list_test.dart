// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'flattened_list.dart';

void main() {
  test('Flattened list 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&ScalarArg=foo&ListArg.1=a&ListArg.2=b&ListArg.3=c'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = FlattenedList(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      listArg: ["a", "b", "c"],
      scalarArg: "foo",
    );
/*
{
  "ScalarArg": "foo",
  "ListArg": [
    "a",
    "b",
    "c"
  ]
}
*/
  });

  test('Flattened list 1', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsQuery(r'''Action=OperationName&Version=2014-01-01&Foo.1=a'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = FlattenedList(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      namedListArg: ["a"],
    );
/*
{
  "NamedListArg": [
    "a"
  ]
}
*/
  });
}
