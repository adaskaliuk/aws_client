// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'base64_encoded_blobs.dart';

void main() {
  test('Base64 encoded Blobs 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&BlobArg=Zm9v'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = Base64EncodedBlobs(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      blobArg: "foo",
    );
/*
{
  "BlobArg": "foo"
}
*/
  });
}
