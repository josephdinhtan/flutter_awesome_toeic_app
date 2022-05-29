
import '../base_model/base_model.dart';
import 'answer_enum.dart';

class PartSixModel implements BaseBusinessModel{
  final String id;
  final String statement;
  final List<int> questionNumber; // length = 3;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartSixModel({
    this.id = "",
    required this.statement,
    required this.questions,
    required this.questionNumber,
    required this.answers,
    required this.correctAnswer,
  });
}
