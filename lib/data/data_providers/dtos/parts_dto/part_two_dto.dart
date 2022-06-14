// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoDto implements BaseDto<PartTwoModel> {
  int number;
  String id;
  String audio_url;
  String correct_ans;
  String question;
  String transcript_a;
  String transcript_b;
  String transcript_c;

  PartTwoDto({
    required this.number,
    required this.id,
    required this.audio_url,
    required this.correct_ans,
    required this.question,
    required this.transcript_a,
    required this.transcript_b,
    required this.transcript_c,
  });

  @override
  PartTwoModel toBusinessModel() {
    return PartTwoModel(
      number: number,
      id: id,
      audioPath: audio_url,
      question: question,
      correctAnswer: _strToAns(correct_ans),
      answers: _ansStrToList(),
    );
  }

  Answer _strToAns(String ansStr) {
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
    }
    return Answer.values[idx];
  }

  List<String> _ansStrToList() {
    List<String> ans = [];
    ans.add(transcript_a);
    ans.add(transcript_b);
    ans.add(transcript_c);
    return ans;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'id': id,
      'audio_url': audio_url,
      'question': question,
      'correct_ans': correct_ans,
      'transcript_a': transcript_a,
      'transcript_b': transcript_b,
      'transcript_c': transcript_c,
    };
  }

  factory PartTwoDto.fromMap(Map<String, dynamic> map) {
    return PartTwoDto(
      number: map['number'] as int,
      id: map['id'] as String,
      audio_url: map['audio_url'] as String,
      question: map['question'] as String,
      correct_ans: map['correct_ans'] as String,
      transcript_a: map['transcript_a'] as String,
      transcript_b: map['transcript_b'] as String,
      transcript_c: map['transcript_c'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory PartTwoDto.fromJson(String source) =>
      PartTwoDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
