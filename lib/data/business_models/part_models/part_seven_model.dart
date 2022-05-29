
import '../base_model/base_model.dart';
import 'answer_enum.dart';

class PartSevenModel implements BaseBusinessModel{
  final List<PartSevenStatement> statement;
  final List<int> questionNumber; // length = 3;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartSevenModel({
    required this.statement,
    required this.questions,
    required this.questionNumber,
    required this.answers,
    required this.correctAnswer,
  });
}

class PartSevenStatement {
  PartSevenStatementTyle style;
  String stringData;

  PartSevenStatement({required this.style, required this.stringData});
}

enum PartSevenStatementTyle {TEXT, IMAGE}