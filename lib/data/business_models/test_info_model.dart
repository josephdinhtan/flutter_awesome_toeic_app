import 'base_model/base_model.dart';

class TestInfoModel extends BaseBusinessModel {
  final String title;
  final String memorySize;
  final int questionNumber;
  final int version;
  final String resourceUrl;
  final int actualScore; // only visiable in DB
  bool isDownloaded; // only visiable in DB
  String? boxId; // only visiable in DB
  TestInfoModel({
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.version,
    required this.resourceUrl,
    this.actualScore = -1,
    this.isDownloaded = false,
    this.boxId,
  });

  @override
  String toString() {
    return "title: $title, size: $memorySize, questionNumber: $questionNumber, ver: $version, resourceUrl: $resourceUrl, score: $actualScore, downloaded: $isDownloaded";
  }
}
