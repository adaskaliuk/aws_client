// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'recursive_shapes.dart';

void main() {
  test('Recursive shapes 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.NoRecurse=foo'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      recursiveStruct: RecursiveStructType(
        noRecurse: "foo",
      ),
    );
/*
{
  "RecursiveStruct": {
    "NoRecurse": "foo"
  }
}
*/
  });

  test('Recursive shapes 1', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.RecursiveStruct.NoRecurse=foo'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      recursiveStruct: RecursiveStructType(
        recursiveStruct: RecursiveStructType(
          noRecurse: "foo",
        ),
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveStruct": {
      "NoRecurse": "foo"
    }
  }
}
*/
  });

  test('Recursive shapes 2', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.RecursiveStruct.RecursiveStruct.RecursiveStruct.NoRecurse=foo'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName2(
      recursiveStruct: RecursiveStructType(
        recursiveStruct: RecursiveStructType(
          recursiveStruct: RecursiveStructType(
            recursiveStruct: RecursiveStructType(
              noRecurse: "foo",
            ),
          ),
        ),
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveStruct": {
      "RecursiveStruct": {
        "RecursiveStruct": {
          "NoRecurse": "foo"
        }
      }
    }
  }
}
*/
  });

  test('Recursive shapes 3', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.RecursiveList.member.1.NoRecurse=foo&RecursiveStruct.RecursiveList.member.2.NoRecurse=bar'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName3(
      recursiveStruct: RecursiveStructType(
        recursiveList: [
          RecursiveStructType(
            noRecurse: "foo",
          ),
          RecursiveStructType(
            noRecurse: "bar",
          )
        ],
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveList": [
      {
        "NoRecurse": "foo"
      },
      {
        "NoRecurse": "bar"
      }
    ]
  }
}
*/
  });

  test('Recursive shapes 4', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.RecursiveList.member.1.NoRecurse=foo&RecursiveStruct.RecursiveList.member.2.RecursiveStruct.NoRecurse=bar'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName4(
      recursiveStruct: RecursiveStructType(
        recursiveList: [
          RecursiveStructType(
            noRecurse: "foo",
          ),
          RecursiveStructType(
            recursiveStruct: RecursiveStructType(
              noRecurse: "bar",
            ),
          )
        ],
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveList": [
      {
        "NoRecurse": "foo"
      },
      {
        "RecursiveStruct": {
          "NoRecurse": "bar"
        }
      }
    ]
  }
}
*/
  });

  test('Recursive shapes 5', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&RecursiveStruct.RecursiveMap.entry.1.key=foo&RecursiveStruct.RecursiveMap.entry.1.value.NoRecurse=foo&RecursiveStruct.RecursiveMap.entry.2.key=bar&RecursiveStruct.RecursiveMap.entry.2.value.NoRecurse=bar'''));
      expect(pathAndQuery(request.url), '/');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName5(
      recursiveStruct: RecursiveStructType(
        recursiveMap: {
          "foo": RecursiveStructType(
            noRecurse: "foo",
          ),
          "bar": RecursiveStructType(
            noRecurse: "bar",
          ),
        },
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveMap": {
      "foo": {
        "NoRecurse": "foo"
      },
      "bar": {
        "NoRecurse": "bar"
      }
    }
  }
}
*/
  });
}
