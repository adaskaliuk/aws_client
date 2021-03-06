// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'non_flattened_list_with_locationname.dart';

void main() {
  test('Non flattened list with LocationName 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&ListArg.item.1=a&ListArg.item.2=b&ListArg.item.3=c'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = NonFlattenedListWithLocationName(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      listArg: ["a", "b", "c"],
    );
/*
{
  "ListArg": [
    "a",
    "b",
    "c"
  ]
}
*/
  });
}
