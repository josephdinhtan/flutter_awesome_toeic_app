import 'answer_enum.dart';

class PartSixModel {
  final String statement;
  final List<int> questionNumber; // length = 3;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartSixModel({
    required this.statement,
    required this.questions,
    required this.questionNumber,
    required this.answers,
    required this.correctAnswer,
  });
}
