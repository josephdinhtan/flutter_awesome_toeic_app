// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'question_hive.g.dart';

@HiveType(typeId: 62)
class QuestionHive extends HiveObject {
  @HiveField(0)
  int number;
  @HiveField(1)
  String? questionStr;
  @HiveField(2)
  List<String>? answers;
  @HiveField(3)
  int correctAnsIdx;
  @HiveField(4)
  int userAnsIdx;
  @HiveField(5)
  String? des;

  QuestionHive({
    required this.number,
    this.questionStr,
    this.answers,
    required this.correctAnsIdx,
    required this.userAnsIdx,
    required this.des,
  });
}
