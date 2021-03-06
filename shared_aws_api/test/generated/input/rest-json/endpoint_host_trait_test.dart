// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'endpoint_host_trait.dart';

void main() {
  test('Endpoint host trait 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Name": "myname"}'''));
      expect(pathAndQuery(request.url), '/path');
      //expect(request.url.host, 'data-service.region.amazonaws.com');
      return Response('{}', 200, headers: {});
    });

    final service = EndpointHostTrait(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.staticOp0(
      name: "myname",
    );
/*
{
  "Name": "myname"
}
*/
  });

  test('Endpoint host trait 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Name": "myname"}'''));
      expect(pathAndQuery(request.url), '/path');
      //expect(request.url.host, 'foo-myname.service.region.amazonaws.com');
      return Response('{}', 200, headers: {});
    });

    final service = EndpointHostTrait(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.memberRefOp1(
      name: "myname",
    );
/*
{
  "Name": "myname"
}
*/
  });
}
