// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'non_flattened_lists_with_locationname.dart';

void main() {
  test('Non flattened lists with locationName 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><AlternateName><NotMember>one</NotMember><NotMember>two</NotMember><NotMember>three</NotMember></AlternateName></OperationRequest>'''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = NonFlattenedListsWithLocationName(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      listParam: ["one", "two", "three"],
    );
/*
{
  "ListParam": [
    "one",
    "two",
    "three"
  ]
}
*/
  });
}
