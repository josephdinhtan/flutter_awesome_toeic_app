import 'answer_enum.dart';

class PartTwoModel {
  final int questionNumber;
  final String soundUrl;
  final List<String> answers;
  final Answer correctAnswer;

  PartTwoModel({
    required this.questionNumber,
    required this.soundUrl,
    required this.answers,
    required this.correctAnswer,
  });
}
