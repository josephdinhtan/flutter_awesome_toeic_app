import 'package:hive/hive.dart';

part 'test_hive_object.g.dart';

@HiveType(typeId: 2)
class TestHiveObject extends HiveObject {
  @HiveField(0)
  String bookFatherBoxId;// for searching
  @HiveField(1)
  String title;
  @HiveField(2)
  String memorySize;
  @HiveField(3)
  int questionNumber;
  @HiveField(4)
  String resourceUrl;// local = network relative path
  @HiveField(5)
  bool isDownloaded;// display open button
  @HiveField(6)
  int actualScore;
  @HiveField(7)
  int version;

  TestHiveObject({
    required this.bookFatherBoxId, // for searching
    required this.title,
    required this.memorySize,
    required this.questionNumber,
    required this.resourceUrl,
    required this.isDownloaded,
    required this.actualScore,// default = -1;
    required this.version,
  });
}
