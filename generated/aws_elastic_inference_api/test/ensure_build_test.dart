import 'package:aws_elastic_inference_api/elastic-inference-2017-07-25.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    ElasticInference(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
