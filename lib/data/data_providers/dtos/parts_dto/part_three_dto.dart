// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_three_model.dart';

class PartThreeDto implements BaseDto<PartThreeModel> {
  String id;
  String audioUrl;
  String? pictureUrl;
  String statement;
  List<int> number;
  List<String> correctAns;
  List<String> question;
  List<String> ansA;
  List<String> ansB;
  List<String> ansC;
  List<String> ansD;

  PartThreeDto({
    required this.id,
    required this.audioUrl,
    required this.pictureUrl,
    required this.statement,
    required this.number,
    required this.correctAns,
    required this.question,
    required this.ansA,
    required this.ansB,
    required this.ansC,
    required this.ansD,
  });

  @override
  PartThreeModel toBusinessModel() {
    return PartThreeModel(
      audioPath: audioUrl,
      picturePath: pictureUrl,
      correctAns: _strToCorrectAns(correctAns),
      id: id,
      numbers: number,
      answers: _strToListAns(),
      questions: question,
      statement: statement,
    );
  }

  List<List<String>> _strToListAns() {
    List<List<String>> ansList = [];
    List<String> ansQuestion1 = [];
    List<String> ansQuestion2 = [];
    List<String> ansQuestion3 = [];
    ansQuestion1.add(ansA[0]);
    ansQuestion1.add(ansB[0]);
    ansQuestion1.add(ansC[0]);
    ansQuestion1.add(ansD[0]);

    ansQuestion2.add(ansA[1]);
    ansQuestion2.add(ansB[1]);
    ansQuestion2.add(ansC[1]);
    ansQuestion2.add(ansD[1]);

    ansQuestion3.add(ansA[2]);
    ansQuestion3.add(ansB[2]);
    ansQuestion3.add(ansC[2]);
    ansQuestion3.add(ansD[2]);
    ansList.add(ansQuestion1);
    ansList.add(ansQuestion2);
    ansList.add(ansQuestion3);
    return ansList;
  }

  List<Answer> _strToCorrectAns(List<String> ansStrList) {
    List<Answer> ansList = [];
    for (String ansStr in ansStrList) {
      int idx = 0;
      switch (ansStr) {
        case "A":
          idx = 0;
          break;
        case "B":
          idx = 1;
          break;
        case "C":
          idx = 2;
          break;
        case "D":
          idx = 2;
          break;
      }
      ansList.add(Answer.values[idx]);
    }
    return ansList;
  }

  factory PartThreeDto.fromMap(Map<String, dynamic> map) {
    List<dynamic> questionGroup = map['question_group'];
    List<int> number = [];
    List<String> correctAns = [];
    List<String> question = [];
    List<String> ansA = [];
    List<String> ansB = [];
    List<String> ansC = [];
    List<String> ansD = [];
    for (dynamic mapQuestion in questionGroup) {
      number.add(mapQuestion['number'] as int);
      correctAns.add(mapQuestion['correct_ans'] as String);
      question.add(mapQuestion['question'] as String);
      ansA.add(mapQuestion['ans_a'] as String);
      ansB.add(mapQuestion['ans_b'] as String);
      ansC.add(mapQuestion['ans_c'] as String);
      ansD.add(mapQuestion['ans_d'] as String);
    }
    return PartThreeDto(
      id: map['id'] as String,
      audioUrl: map['audio_url'] as String,
      pictureUrl: map['picture_url'] as String?,
      statement: map['statement'] as String,
      number: number,
      correctAns: correctAns,
      question: question,
      ansA: ansA,
      ansB: ansB,
      ansC: ansC,
      ansD: ansD,
    );
  }
}
