import '../base_model/base_business_model.dart';
import 'answer_enum.dart';

class PartSevenModel implements BaseBusinessModel {
  final List<PartSevenStatement> statement;
  final String id;
  final List<int> numbers; // length = 3;
  final List<String> questions;
  final List<List<String>> answers;
  final List<Answer> correctAnswer;

  PartSevenModel({
    required this.statement,
    required this.id,
    required this.questions,
    required this.numbers,
    required this.answers,
    required this.correctAnswer,
  });
}

class PartSevenStatement {
  PartSevenStatementType style;
  String stringData;

  PartSevenStatement({required this.style, required this.stringData});
}

enum PartSevenStatementType { text, image }
