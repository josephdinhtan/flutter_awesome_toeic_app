import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartFiveModel implements BaseBusinessModel {
  final int number;
  final String id;
  final String question;
  final List<String> answers;
  final Answer correctAnswer;

  PartFiveModel({
    required this.question,
    required this.id,
    required this.number,
    required this.answers,
    required this.correctAnswer,
  });
}
