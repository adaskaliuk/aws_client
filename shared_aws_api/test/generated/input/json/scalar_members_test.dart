// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'scalar_members.dart';

void main() {
  test('Scalar members 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Name": "myname"}'''));
      expect(
          request.headers['X-Amz-Target'], 'com.amazonaws.foo.OperationName');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = ScalarMembers(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      name: "myname",
    );
/*
{
  "Name": "myname"
}
*/
  });
}
