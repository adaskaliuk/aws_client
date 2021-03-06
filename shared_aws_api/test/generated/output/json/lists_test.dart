// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'lists.dart';

void main() {
  test('Lists 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{"ListMember": ["a", "b"]}''', 200, headers: {});
    });

    final service = Lists(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.listMember[0], "a");
    expect(output.listMember[1], "b");
    expect(output.listMemberMap, isNull);
    expect(output.listMemberStruct, isNull);
/*
{
  "ListMember": [
    "a",
    "b"
  ]
}
*/
  });

  test('Lists 1', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"ListMember": ["a", null], "ListMemberMap": [{}, null, null, {}], "ListMemberStruct": [{}, null, null, {}]}''',
          200,
          headers: {});
    });

    final service = Lists(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName1();
    expect(output.listMember[0], "a");
    expect(output.listMember[1], isNull);
    expect(output.listMemberMap[1], isNull);
    expect(output.listMemberMap[2], isNull);
    expect(output.listMemberStruct[1], isNull);
    expect(output.listMemberStruct[2], isNull);
/*
{
  "ListMember": [
    "a",
    null
  ],
  "ListMemberMap": [
    {},
    null,
    null,
    {}
  ],
  "ListMemberStruct": [
    {},
    null,
    null,
    {}
  ]
}
*/
  });
}
