import 'answer_enum.dart';

class PartThreeModel {
  final List<int> questionNumber; // length = 3;
  final int numOfQuestion; // length = 3;
  final String soundUrl;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartThreeModel({
    required this.questions,
    required this.questionNumber,
    required this.numOfQuestion,
    required this.soundUrl,
    required this.answers,
    required this.correctAnswer,
  });
}
