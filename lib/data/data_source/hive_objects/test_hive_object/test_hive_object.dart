import 'package:hive/hive.dart';

part 'test_hive_object.g.dart';

@HiveType(typeId: 2)
class TestHiveObject extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String memorySize;
  @HiveField(2)
  int questionNumber;
  @HiveField(3)
  String resourceUrl;// local = network relative path
  @HiveField(4)
  bool isDownloaded;// display open button
  @HiveField(5)
  int actualScore;
  @HiveField(6)
  int version;

  TestHiveObject({
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.resourceUrl,
    required this.isDownloaded,
    required this.actualScore,// default = -1;
    required this.version,
  });
}
