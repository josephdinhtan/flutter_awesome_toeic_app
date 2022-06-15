// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_four_model.dart';

class PartFourDto implements BaseDto<PartFourModel> {
  String id;
  String audio_url;
  String? picture_url;
  String statement;
  List<int> number;
  List<String> correct_ans;
  List<String> question;
  List<String> ans_a;
  List<String> ans_b;
  List<String> ans_c;
  List<String> ans_d;

  PartFourDto({
    required this.id,
    required this.audio_url,
    required this.picture_url,
    required this.statement,
    required this.number,
    required this.correct_ans,
    required this.question,
    required this.ans_a,
    required this.ans_b,
    required this.ans_c,
    required this.ans_d,
  });

  @override
  PartFourModel toBusinessModel() {
    return PartFourModel(
      audioPath: audio_url,
      picturePath: picture_url,
      correctAns: _strToCorrectAns(correct_ans),
      id: id,
      numbers: number,
      answers: _StrToListAns(),
      questions: question,
      statement: statement,
    );
  }

  List<List<String>> _StrToListAns() {
    List<List<String>> ansList = [];
    List<String> ansQuestion1 = [];
    List<String> ansQuestion2 = [];
    List<String> ansQuestion3 = [];
    ansQuestion1.add(ans_a[0]);
    ansQuestion1.add(ans_b[0]);
    ansQuestion1.add(ans_c[0]);
    ansQuestion1.add(ans_d[0]);

    ansQuestion2.add(ans_a[1]);
    ansQuestion2.add(ans_b[1]);
    ansQuestion2.add(ans_c[1]);
    ansQuestion2.add(ans_d[1]);

    ansQuestion3.add(ans_a[2]);
    ansQuestion3.add(ans_b[2]);
    ansQuestion3.add(ans_c[2]);
    ansQuestion3.add(ans_d[2]);
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

  factory PartFourDto.fromMap(Map<String, dynamic> map) {
    List<dynamic> question_group = map['question_group'];
    List<int> number = [];
    List<String> correct_ans = [];
    List<String> question = [];
    List<String> ans_a = [];
    List<String> ans_b = [];
    List<String> ans_c = [];
    List<String> ans_d = [];
    for (dynamic mapQuestion in question_group) {
      number.add(mapQuestion['number'] as int);
      correct_ans.add(mapQuestion['correct_ans'] as String);
      question.add(mapQuestion['question'] as String);
      ans_a.add(mapQuestion['ans_a'] as String);
      ans_b.add(mapQuestion['ans_b'] as String);
      ans_c.add(mapQuestion['ans_c'] as String);
      ans_d.add(mapQuestion['ans_d'] as String);
    }
    return PartFourDto(
      id: map['id'] as String,
      audio_url: map['audio_url'] as String,
      picture_url: map['picture_url'] as String?,
      statement: map['statement'] as String,
      number: number,
      correct_ans: correct_ans,
      question: question,
      ans_a: ans_a,
      ans_b: ans_b,
      ans_c: ans_c,
      ans_d: ans_d,
    );
  }
}
