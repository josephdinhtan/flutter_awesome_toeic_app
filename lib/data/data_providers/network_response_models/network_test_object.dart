import 'package:hive/hive.dart';

import '../../business_models/test_info_model.dart';
import '../../data_source/hive_objects/test_hive_object/test_hive_object.dart';
import 'network_base_object.dart';

class NetworkTestObject implements NetworkBaseObject<TestInfoModel> {
  String boxId;
  String title;
  String memorySize;
  int questionNumber;
  String resourceUrl;
  int version;

  NetworkTestObject({
    required this.boxId,
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.resourceUrl,
    required this.version,
  });

  factory NetworkTestObject.fromJson(dynamic jsonMap) {
    return NetworkTestObject(
      boxId: "_",
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

  HiveObject toHiveObject() {
    return TestHiveObject(title: title,
      actualScore: -1,
      isDownloaded: false,
      memorySize: memorySize,
      questionNumber: questionNumber,
      //bookFatherBoxId:,
      resourceUrl: resourceUrl,
      version: version,);
  }
}
