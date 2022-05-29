import '../../business_models/test_info_model.dart';
import 'network_base_object.dart';

class NetworkTestObject implements NetworkBaseObject<TestInfoModel> {
  String title;
  String memorySize;
  int questionNumber;
  String resourceUrl;
  int version;

  NetworkTestObject({
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.resourceUrl,
    required this.version,
  });

  factory NetworkTestObject.fromJson(dynamic jsonMap) {
    return NetworkTestObject(
      title: jsonMap['title'] as String,
      memorySize: jsonMap['size'] as String,
      questionNumber: jsonMap['question_number'] as int,
      resourceUrl: jsonMap['resource_url'] as String,
      version: jsonMap['ver'] as int,
    );
  }

  @override
  TestInfoModel toBusinessModel() {
    return TestInfoModel(
      title: title,
      memorySize: memorySize,
      questionNumber: questionNumber,
      version: version,
      resourceUrl: resourceUrl,
    );
  }
}
