// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/part_execute_hive_object/part_two_hive_object.dart';

import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartTwoModel implements BaseBusinessModel {
  final int number;
  final String id;
  final String audioPath;
  final Answer correctAnswer;
  final String question;
  final List<String> answers;

  PartTwoModel({
    required this.number,
    required this.id,
    required this.audioPath,
    required this.correctAnswer,
    required this.question,
    required this.answers,
  });

  PartTwoHiveObject toHiveObject() {
    return PartTwoHiveObject(
      answers: answers,
      audioPath: audioPath,
      correctAnswerIndex: correctAnswer.index,
      id: id,
      number: number,
      question: question,
    );
  }

  factory PartTwoModel.fromHiveObject(PartTwoHiveObject hiveObject) {
    return PartTwoModel(
      answers: hiveObject.answers,
      audioPath: hiveObject.audioPath,
      correctAnswer: Answer.values[hiveObject.correctAnswerIndex],
      id: hiveObject.id,
      number: hiveObject.number,
      question: hiveObject.question,
    );
  }
}
