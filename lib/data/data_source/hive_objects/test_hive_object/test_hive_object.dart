// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'test_hive_object.g.dart';

@HiveType(typeId: 2)
class TestHiveObject extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String memorySize;
  @HiveField(3)
  int numOfQuestion;
  @HiveField(4)
  int? actualScore;
  @HiveField(5)
  int ver;
  @HiveField(6)
  String picturePath;
  @HiveField(7)
  String audioPath;
  @HiveField(8)
  List<String> partIds;
  @HiveField(9)
  bool isResourceDownloaded;

  TestHiveObject({
    required this.id,
    required this.title,
    required this.memorySize,
    required this.numOfQuestion,
    required this.actualScore,
    required this.ver,
    required this.picturePath,
    required this.audioPath,
    required this.partIds,
    required this.isResourceDownloaded,
  });
}
