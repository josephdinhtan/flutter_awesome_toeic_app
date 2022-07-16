// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'part_hive_object.g.dart';

@HiveType(typeId: 3)
class PartHiveObject extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int partType;
  @HiveField(3)
  int numOfQuestion;
  @HiveField(4)
  int numOfCorrect;
  @HiveField(5)
  int ver;
  @HiveField(6)
  List<String> questionIds;

  PartHiveObject({
    required this.id,
    required this.title,
    required this.partType,
    required this.numOfQuestion,
    required this.numOfCorrect,
    required this.ver,
    required this.questionIds,
  });
}
