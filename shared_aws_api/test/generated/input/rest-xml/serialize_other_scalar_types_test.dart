// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'serialize_other_scalar_types.dart';

void main() {
  test('Serialize other scalar types 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><First>true</First><Second>false</Second><Third>1.2</Third><Fourth>3</Fourth></OperationRequest>'''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = SerializeOtherScalarTypes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      first: true,
      fourth: 3,
      second: false,
      third: 1.2,
    );
/*
{
  "First": true,
  "Second": false,
  "Third": 1.2,
  "Fourth": 3
}
*/
  });
}
