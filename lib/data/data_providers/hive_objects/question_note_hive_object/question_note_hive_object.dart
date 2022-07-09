// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'question_note_hive_object.g.dart';

@HiveType(typeId: 20)
class QuestionNoteHiveObject extends HiveObject {
  @HiveField(0)
  int partType;
  @HiveField(1)
  String id;
  @HiveField(2)
  String note;
  @HiveField(3)
  int questionNum;

  QuestionNoteHiveObject({
    required this.partType,
    required this.id,
    required this.note,
    required this.questionNum,
  });
}
