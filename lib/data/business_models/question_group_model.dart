// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../data_providers/hive_objects/part_execute_hive_object/question_group_hive.dart';
import '../data_providers/hive_objects/part_execute_hive_object/question_hive.dart';
import '../data_providers/hive_objects/part_execute_hive_object/statement_hive.dart';
import 'base_model/base_business_model.dart';
import 'execute_models/answer_enum.dart';
import 'part_model.dart';

class QuestionGroupModel extends BaseBusinessModel {
  String id;
  PartType partType;
  String? audioPath;
  String? picturePath;
  List<Statement>? statement;
  List<QuestionModel> questions;

  QuestionGroupModel({
    required this.id,
    required this.partType,
    required this.questions,
    required this.statement,
    required this.audioPath,
    required this.picturePath,
  });

  QuestionGroupHive toHiveObject() {
    return QuestionGroupHive(
      id: id,
      partTypeIdx: partType.index,
      questions: questions.map((e) => e.toHiveObject()).toList(),
      audioPath: audioPath,
      statement: statement?.map((e) => e.toHiveObject()).toList(),
      picturePath: picturePath,
    );
  }

  factory QuestionGroupModel.fromHiveObject(QuestionGroupHive hiveObject) {
    return QuestionGroupModel(
      audioPath: hiveObject.audioPath,
      picturePath: hiveObject.picturePath,
      id: hiveObject.id,
      partType: PartType.values[hiveObject.partTypeIdx],
      questions: hiveObject.questions
          .map((e) => QuestionModel.fromHiveObject(e))
          .toList(),
      statement: hiveObject.statement
          ?.map((e) => Statement.fromHiveObject(e))
          .toList(),
    );
  }
}

class QuestionModel {
  int number;
  String? questionStr;
  List<String>? answers;
  Answer correctAns;
  Answer userAnswer;

  QuestionModel({
    required this.number,
    required this.questionStr,
    required this.answers,
    required this.correctAns,
    required this.userAnswer,
  });

  QuestionHive toHiveObject() {
    return QuestionHive(
      number: number,
      correctAnsIdx: correctAns.index,
      answers: answers,
      questionStr: questionStr,
      userAnsIdx: userAnswer.index,
    );
  }

  factory QuestionModel.fromHiveObject(QuestionHive hiveObject) {
    return QuestionModel(
      number: hiveObject.number,
      correctAns: Answer.values[hiveObject.correctAnsIdx],
      userAnswer: Answer.values[hiveObject.userAnsIdx],
      answers: hiveObject.answers,
      questionStr: hiveObject.questionStr,
    );
  }
}

class Statement {
  StatementType statementType;
  String content;
  Statement({
    required this.statementType,
    required this.content,
  });

  StatementHive toHiveObject() {
    return StatementHive(
      statementTypeIdx: statementType.index,
      content: content,
    );
  }

  factory Statement.fromHiveObject(StatementHive hiveObject) {
    return Statement(
      statementType: StatementType.values[hiveObject.statementTypeIdx],
      content: hiveObject.content,
    );
  }
}

enum StatementType { text, picture }
