// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'json_value_trait.dart';

void main() {
  test('JSON value trait 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body, equalsJson(r'''{"BodyField":"{\"Foo\":\"Bar\"}"}'''));
      expect(request.headers['X-Amz-Foo'], 'eyJGb28iOiJCYXIifQ==');
      expect(pathAndQuery(request.url), '/?Bar=%7B%22Foo%22%3A%22Bar%22%7D');
      return Response('{}', 200, headers: {});
    });

    final service = JSONValueTrait(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      body: BodyStructure(
        bodyField: r'''{"Foo":"Bar"}''',
      ),
      headerField: r'''{"Foo":"Bar"}''',
      queryField: r'''{"Foo":"Bar"}''',
    );
/*
{
  "HeaderField": {
    "Foo": "Bar"
  },
  "QueryField": {
    "Foo": "Bar"
  },
  "Body": {
    "BodyField": {
      "Foo": "Bar"
    }
  }
}
*/
  });

  test('JSON value trait 1', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"BodyListField":["{\"Foo\":\"Bar\"}"]}'''));
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = JSONValueTrait(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      body: BodyStructure(
        bodyListField: [r'''{"Foo":"Bar"}'''],
      ),
    );
/*
{
  "Body": {
    "BodyListField": [
      {
        "Foo": "Bar"
      }
    ]
  }
}
*/
  });

  test('JSON value trait 2', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = JSONValueTrait(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName2();
/*
{}
*/
  });
}
