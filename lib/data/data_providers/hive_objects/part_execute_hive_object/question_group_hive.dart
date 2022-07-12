// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/part_execute_hive_object/question_hive.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/part_execute_hive_object/statement_hive.dart';

part 'question_group_hive.g.dart';

@HiveType(typeId: 61)
class QuestionGroupHive extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int partTypeIdx;
  @HiveField(2)
  String? audioPath;
  @HiveField(3)
  String? picturePath;
  @HiveField(4)
  List<QuestionHive> questions;
  @HiveField(5)
  List<StatementHive>? statement;
  QuestionGroupHive({
    required this.id,
    required this.partTypeIdx,
    this.audioPath,
    this.picturePath,
    required this.questions,
    this.statement,
  });
}
