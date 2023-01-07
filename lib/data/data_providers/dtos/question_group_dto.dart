// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../business_models/execute_models/answer_enum.dart';
import '../../business_models/part_model.dart';
import '../../business_models/question_group_model.dart';
import 'base_dto/base_dto.dart';

class QuestionGroupDto extends BaseDto<QuestionGroupModel> {
  String id;
  int partTypeIdx;
  String? audioPath;
  String? imagePath;
  List<StatementDto>? statements;
  List<QuestionDto> questions;
  QuestionGroupDto({
    required this.id,
    required this.partTypeIdx,
    this.audioPath,
    this.imagePath,
    this.statements,
    required this.questions,
  });

  @override
  QuestionGroupModel toBusinessModel() {
    return QuestionGroupModel(
        id: id,
        partType: PartType.values[partTypeIdx],
        questions: questions.map((e) => e.toQuestionModel()).toList(),
        audioPath: audioPath,
        picturePath: imagePath,
        statements: statements?.map((e) => e.toStatement()).toList());
  }

  factory QuestionGroupDto.fromMap(Map<String, dynamic> map, int partTypeIdx) {
    return QuestionGroupDto(
      id: map['id'] as String,
      partTypeIdx: partTypeIdx,
      audioPath: map['audio_url'] != null ? map['audio_url'] as String : null,
      imagePath: map['image_url'] != null ? map['image_url'] as String : null,
      statements: map['statements'] != null
          ? List<StatementDto>.from(
              (map['statements'] as List<dynamic>).map(
                (x) => StatementDto.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      questions: List<QuestionDto>.from(
        (map['questions'] as List<dynamic>).map(
          (x) => QuestionDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory QuestionGroupDto.fromJson(String source, int partTypeIdx) =>
      QuestionGroupDto.fromMap(
          json.decode(source) as Map<String, dynamic>, partTypeIdx);
}

class QuestionDto {
  int number;
  String? questionStr;
  String? des;
  List<String>? answers;
  int correctAnsIdx;
  QuestionDto({
    required this.number,
    required this.questionStr,
    required this.answers,
    required this.correctAnsIdx,
    required this.des,
  });

  QuestionModel toQuestionModel() {
    return QuestionModel(
      number: number,
      correctAns: Answer.values[correctAnsIdx],
      userAnswer: Answer.notAnswer,
      answers: answers,
      questionStr: questionStr,
      des: des,
    );
  }

  factory QuestionDto.fromMap(Map<String, dynamic> map) {
    return QuestionDto(
      number: map['num'] as int,
      questionStr: map['question'] as String?,
      answers: map['answers'] != null
          ? List<String>.from((map['answers'] as List<dynamic>))
          : null,
      correctAnsIdx: map['correct'] as int,
      des: map['des'] as String?,
    );
  }

  factory QuestionDto.fromJson(String source) =>
      QuestionDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class StatementDto {
  int statementTypeIdx;
  String content;
  String? des;
  StatementDto({
    required this.statementTypeIdx,
    required this.content,
    required this.des,
  });

  Statement toStatement() {
    return Statement(
      statementType: StatementType.values[statementTypeIdx],
      content: content,
      des: des,
    );
  }

  factory StatementDto.fromMap(Map<String, dynamic> map) {
    return StatementDto(
      statementTypeIdx: map['type'] as int,
      content: map['content'] as String,
      des: map['des'] as String?,
    );
  }

  factory StatementDto.fromJson(String source) =>
      StatementDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
