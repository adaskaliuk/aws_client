// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

import 'enum_output.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Enum output
class EnumOutput {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  EnumOutput({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: 'EnumOutput',
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<OutputShape> operationName0() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final EC2EnumType fooEnum;
  final List<String> listEnums;

  OutputShape({
    this.fooEnum,
    this.listEnums,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      fooEnum: _s.extractXmlStringValue(elem, 'FooEnum')?.toEC2EnumType(),
      listEnums: _s
          .extractXmlChild(elem, 'ListEnums')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

enum EC2EnumType {
  @_s.JsonValue('foo')
  foo,
  @_s.JsonValue('bar')
  bar,
}

extension on String {
  EC2EnumType toEC2EnumType() {
    switch (this) {
      case 'foo':
        return EC2EnumType.foo;
      case 'bar':
        return EC2EnumType.bar;
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
