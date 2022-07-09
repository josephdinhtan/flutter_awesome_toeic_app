import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartSixModel implements BaseBusinessModel {
  final String id;
  final String statement;
  final List<int> numbers; // length = 3;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartSixModel({
    this.id = "",
    required this.statement,
    required this.questions,
    required this.numbers,
    required this.answers,
    required this.correctAnswer,
  });
}
