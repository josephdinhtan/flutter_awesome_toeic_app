// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'part_two_hive_object.g.dart';

@HiveType(typeId: 12)
class PartTwoHiveObject extends HiveObject {
  @HiveField(0)
  int number;
  @HiveField(1)
  String id;
  @HiveField(2)
  String audioPath;
  @HiveField(3)
  int correctAnswerIndex; // display open button
  @HiveField(4)
  String question;
  @HiveField(5)
  List<String> answers;

  PartTwoHiveObject({
    required this.number,
    required this.id,
    required this.audioPath,
    required this.correctAnswerIndex,
    required this.question,
    required this.answers,
  });
}
