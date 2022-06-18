// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data_providers/hive_objects/part_execute_hive_object/part_four_hive_object.dart';
import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartFourModel implements BaseBusinessModel {
  final String audioPath;
  final String id;
  final String? picturePath;
  final String statement;
  final List<int> numbers; // length = 3;
  final List<Answer> correctAns;
  final List<String> questions;
  final List<List<String>> answers;

  PartFourModel({
    required this.audioPath,
    required this.id,
    required this.picturePath,
    required this.statement,
    required this.correctAns,
    required this.questions,
    required this.answers,
    required this.numbers,
  });

  PartFourHiveObject toHiveObject() {
    return PartFourHiveObject(
      answers: answers,
      audioPath: audioPath,
      id: id,
      numbers: numbers,
      picturePath: picturePath,
      questions: questions,
      statement: statement,
      correctAnsIndexes: _ansToListInt(),
    );
  }

  factory PartFourModel.fromHiveObject(PartFourHiveObject hiveObject) {
    return PartFourModel(
      answers: hiveObject.answers,
      audioPath: hiveObject.audioPath,
      id: hiveObject.id,
      numbers: hiveObject.numbers,
      picturePath: hiveObject.picturePath,
      questions: hiveObject.questions,
      statement: hiveObject.statement,
      correctAns: _listIntToAns(hiveObject.correctAnsIndexes),
    );
  }

  List<int> _ansToListInt() {
    List<int> correctAnsList = [];
    for (Answer ans in correctAns) {
      correctAnsList.add(ans.index);
    }
    return correctAnsList;
  }

  static List<Answer> _listIntToAns(List<int> correctAnswers) {
    List<Answer> correctAnsList = [];
    for (int ans in correctAnswers) {
      correctAnsList.add(Answer.values[ans]);
    }
    return correctAnsList;
  }
}
