// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import '../data_providers/hive_objects/test_hive_object/test_hive_object.dart';
import 'base_model/base_business_model.dart';

class TestModel extends BaseBusinessModel {
  String id;
  String title;
  String memorySize;
  int numOfQuestion;
  int? actualScore;
  int ver;
  String picturePath;
  String audioPath;
  List<String> partIds;
  bool isResourceDownloaded;

  TestModel({
    required this.id,
    required this.title,
    required this.memorySize,
    required this.numOfQuestion,
    required this.actualScore,
    required this.ver,
    required this.picturePath,
    required this.audioPath,
    required this.partIds,
    this.isResourceDownloaded = false,
  });

  @override
  String toString() {
    return "title: $title, size: $memorySize, questionNumber: $numOfQuestion, ver: $ver, resourceUrl: $picturePath, score: $actualScore, downloaded: $isResourceDownloaded";
  }

  HiveObject toHiveObject() {
    return TestHiveObject(
      id: id,
      title: title,
      actualScore: actualScore,
      isResourceDownloaded: isResourceDownloaded,
      memorySize: memorySize,
      numOfQuestion: numOfQuestion,
      picturePath: picturePath,
      audioPath: audioPath,
      ver: ver,
      partIds: partIds,
    );
  }

  factory TestModel.fromHiveObject(TestHiveObject hiveObject) {
    return TestModel(
      id: hiveObject.id,
      ver: hiveObject.ver,
      picturePath: hiveObject.picturePath,
      numOfQuestion: hiveObject.numOfQuestion,
      memorySize: hiveObject.memorySize,
      title: hiveObject.title,
      isResourceDownloaded: hiveObject.isResourceDownloaded,
      actualScore: hiveObject.actualScore,
      audioPath: hiveObject.audioPath,
      partIds: hiveObject.partIds,
    );
  }
}
