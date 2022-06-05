import 'package:hive/hive.dart';

import '../data_source/hive_objects/test_hive_object/test_hive_object.dart';
import 'base_model/base_model.dart';

class TestInfoModel extends BaseBusinessModel {
  String hiveId;
  final String title;
  final String memorySize;
  final int questionNumber;
  final int version;
  final String resourceUrl;
  final int actualScore; // only visiable in DB
  bool isDownloaded; // only visiable in DB
  TestInfoModel({
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.version,
    required this.resourceUrl,
    this.actualScore = -1,
    this.isDownloaded = false,
    this.hiveId = "",
  });

  @override
  String toString() {
    return "title: $title, size: $memorySize, questionNumber: $questionNumber, ver: $version, resourceUrl: $resourceUrl, score: $actualScore, downloaded: $isDownloaded";
  }

  HiveObject toHiveObject() {
    return TestHiveObject(title: title,
      actualScore: actualScore,
      isDownloaded: isDownloaded,
      memorySize: memorySize,
      questionNumber: questionNumber,
      //bookFatherBoxId:,
      resourceUrl: resourceUrl,
      version: version,);
  }

  static TestInfoModel fromHiveObject(TestHiveObject hiveObject) {
    return TestInfoModel(
      version: hiveObject.version,
      resourceUrl: hiveObject.resourceUrl,
      questionNumber: hiveObject.questionNumber,
      memorySize: hiveObject.memorySize,
      title: hiveObject.title,
      isDownloaded: hiveObject.isDownloaded,
      actualScore: hiveObject.actualScore,
    );
  }
}
