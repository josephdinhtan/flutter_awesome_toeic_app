// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_one_model.dart';

class PartOneDto implements BaseDto<PartOneModel> {
  int number;
  String id;
  String audio_url;
  String picture_url;
  String correct_ans;
  String transcript_a;
  String transcript_b;
  String transcript_c;
  String transcript_d;

  PartOneDto({
    required this.number,
    required this.id,
    required this.audio_url,
    required this.picture_url,
    required this.correct_ans,
    required this.transcript_a,
    required this.transcript_b,
    required this.transcript_c,
    required this.transcript_d,
  });

  @override
  PartOneModel toBusinessModel() {
    return PartOneModel(
      number: number,
      id: id,
      audioPath: audio_url,
      picturePath: picture_url,
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
      case "D":
        idx = 3;
        break;
    }
    return Answer.values[idx];
  }

  List<String> _ansStrToList() {
    List<String> ans = [];
    ans.add(transcript_a);
    ans.add(transcript_b);
    ans.add(transcript_c);
    ans.add(transcript_d);
    return ans;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'id': id,
      'audio_url': audio_url,
      'picture_url': picture_url,
      'correct_ans': correct_ans,
      'transcript_a': transcript_a,
      'transcript_b': transcript_b,
      'transcript_c': transcript_c,
      'transcript_d': transcript_d,
    };
  }

  factory PartOneDto.fromMap(Map<String, dynamic> map) {
    return PartOneDto(
      number: map['number'] as int,
      id: map['id'] as String,
      audio_url: map['audio_url'] as String,
      picture_url: map['picture_url'] as String,
      correct_ans: map['correct_ans'] as String,
      transcript_a: map['transcript_a'] as String,
      transcript_b: map['transcript_b'] as String,
      transcript_c: map['transcript_c'] as String,
      transcript_d: map['transcript_d'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory PartOneDto.fromJson(String source) =>
      PartOneDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
