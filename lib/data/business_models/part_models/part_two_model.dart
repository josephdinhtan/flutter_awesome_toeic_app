
import '../base_model/base_model.dart';
import 'answer_enum.dart';

class PartTwoModel implements BaseBusinessModel{
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
