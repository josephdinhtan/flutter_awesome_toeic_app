// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data_source/hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartOneModel implements BaseBusinessModel {
  final int number;
  final String id;
  final String audioPath;
  final String picturePath;
  final Answer correctAnswer;
  final List<String> answers;

  PartOneModel({
    required this.number,
    required this.id,
    required this.audioPath,
    required this.picturePath,
    required this.answers,
    required this.correctAnswer,
  });

  PartOneHiveObject toHiveObject() {
    return PartOneHiveObject(
      answers: answers,
      audioPath: audioPath,
      correctAnswerIndex: correctAnswer.index,
      id: id,
      number: number,
      picturePath: picturePath,
    );
  }

  factory PartOneModel.fromHiveObject(PartOneHiveObject hiveObject) {
    return PartOneModel(
      answers: hiveObject.answers,
      audioPath: hiveObject.audioPath,
      correctAnswer: Answer.values[hiveObject.correctAnswerIndex],
      id: hiveObject.id,
      number: hiveObject.number,
      picturePath: hiveObject.picturePath,
    );
  }
}
