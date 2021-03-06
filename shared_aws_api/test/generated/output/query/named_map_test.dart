// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'named_map.dart';

void main() {
  test('Named map 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse><OperationNameResult><Map><foo>qux</foo><bar>bar</bar></Map><Map><foo>baz</foo><bar>bam</bar></Map></OperationNameResult><ResponseMetadata><RequestId>requestid</RequestId></ResponseMetadata></OperationNameResponse>''',
          200,
          headers: {});
    });

    final service = NamedMap(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.map['qux'], "bar");
    expect(output.map['baz'], "bam");
/*
{
  "Map": {
    "qux": "bar",
    "baz": "bam"
  }
}
*/
  });
}
