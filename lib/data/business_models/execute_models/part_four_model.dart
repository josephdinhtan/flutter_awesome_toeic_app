import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartFourModel implements BaseBusinessModel {
  final List<int> questionNumber; // length = 3;
  final String soundUrl;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartFourModel({
    required this.questions,
    required this.questionNumber,
    required this.soundUrl,
    required this.answers,
    required this.correctAnswer,
  });
}
