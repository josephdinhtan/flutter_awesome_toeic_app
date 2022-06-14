// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data_providers/hive_objects/part_execute_hive_object/part_three_hive_object.dart';
import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartThreeModel implements BaseBusinessModel {
  final String audioPath;
  final String id;
  final String? picturePath;
  final String statement;
  final List<int> numbers; // length = 3;
  final List<Answer> correctAns;
  final List<String> questions;
  final List<List<String>> answers;

  PartThreeModel({
    required this.audioPath,
    required this.id,
    required this.picturePath,
    required this.statement,
    required this.correctAns,
    required this.questions,
    required this.answers,
    required this.numbers,
  });

  PartThreeHiveObject toHiveObject() {
    return PartThreeHiveObject(
      answers: answers,
      audioPath: audioPath,
      id: id,
      numbers: numbers,
      picturePath: picturePath,
      questions: questions,
      statement: statement,
      correctAnsIndexs: _AnsToListInt(),
    );
  }

  factory PartThreeModel.fromHiveObject(PartThreeHiveObject hiveObject) {
    return PartThreeModel(
      answers: hiveObject.answers,
      audioPath: hiveObject.audioPath,
      id: hiveObject.id,
      numbers: hiveObject.numbers,
      picturePath: hiveObject.picturePath,
      questions: hiveObject.questions,
      statement: hiveObject.statement,
      correctAns: _ListIntToAns(hiveObject.correctAnsIndexs),
    );
  }

  List<int> _AnsToListInt() {
    List<int> correctAnsList = [];
    for (Answer ans in correctAns) {
      correctAnsList.add(ans.index);
    }
    return correctAnsList;
  }

  static List<Answer> _ListIntToAns(List<int> correctAnswers) {
    List<Answer> correctAnsList = [];
    for (int ans in correctAnswers) {
      correctAnsList.add(Answer.values[ans]);
    }
    return correctAnsList;
  }
}
