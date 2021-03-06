// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'idempotency_token_auto_fill.dart';

void main() {
  test('Idempotency token auto fill 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&Token=abc123'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = IdempotencyTokenAutoFill(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      token: "abc123",
    );
/*
{
  "Token": "abc123"
}
*/
  });

  test('Idempotency token auto fill 1', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&Token=00000000-0000-4000-8000-000000000000'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = IdempotencyTokenAutoFill(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1();
/*
{}
*/
  });
}
