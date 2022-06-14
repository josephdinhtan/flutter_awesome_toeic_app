// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'part_one_hive_object.g.dart';

@HiveType(typeId: 11)
class PartOneHiveObject extends HiveObject {
  @HiveField(0)
  int number;
  @HiveField(1)
  String id;
  @HiveField(2)
  String audioPath;
  @HiveField(3)
  String picturePath; // local = network relative path
  @HiveField(4)
  int correctAnswerIndex; // display open button
  @HiveField(5)
  List<String> answers;

  PartOneHiveObject({
    required this.number,
    required this.id,
    required this.audioPath,
    required this.picturePath,
    required this.correctAnswerIndex,
    required this.answers,
  });
}
