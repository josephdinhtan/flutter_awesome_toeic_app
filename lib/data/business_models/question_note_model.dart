// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/question_note_hive_object/question_note_hive_object.dart';
import 'package:hive/hive.dart';

import 'base_model/base_business_model.dart';
import 'part_model.dart';

class QuestionNoteModel extends BaseBusinessModel {
  final PartType partType;
  final int questionNum;
  final String id;
  final String note;
  QuestionNoteModel({
    required this.partType,
    required this.id,
    required this.note,
    required this.questionNum,
  });

  HiveObject toHiveObject() {
    return QuestionNoteHiveObject(
      id: id,
      note: note,
      partType: partType.index,
      questionNum: questionNum,
    );
  }

  factory QuestionNoteModel.fromHiveObject(QuestionNoteHiveObject hiveObject) {
    return QuestionNoteModel(
      id: hiveObject.id,
      note: hiveObject.note,
      partType: PartType.values[hiveObject.partType],
      questionNum: hiveObject.questionNum,
    );
  }
}
