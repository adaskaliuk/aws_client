// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'serialize_map_type.dart';

void main() {
  test('Serialize map type 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&MapArg.entry.1.key=key1&MapArg.entry.1.value=val1&MapArg.entry.2.key=key2&MapArg.entry.2.value=val2'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = SerializeMapType(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      mapArg: {
        "key1": "val1",
        "key2": "val2",
      },
    );
/*
{
  "MapArg": {
    "key1": "val1",
    "key2": "val2"
  }
}
*/
  });
}
