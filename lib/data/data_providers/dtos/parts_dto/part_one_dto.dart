// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_one_model.dart';

class PartOneDto implements BaseDto<PartOneModel> {
  int number;
  String id;
  String audioUrl;
  String pictureUrl;
  String correctAns;
  String transcriptA;
  String transcriptB;
  String transcriptC;
  String transcriptD;

  PartOneDto({
    required this.number,
    required this.id,
    required this.audioUrl,
    required this.pictureUrl,
    required this.correctAns,
    required this.transcriptA,
    required this.transcriptB,
    required this.transcriptC,
    required this.transcriptD,
  });

  @override
  PartOneModel toBusinessModel() {
    return PartOneModel(
      number: number,
      id: id,
      audioPath: audioUrl,
      picturePath: pictureUrl,
      correctAnswer: _strToAns(correctAns),
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
    ans.add(transcriptA);
    ans.add(transcriptB);
    ans.add(transcriptC);
    ans.add(transcriptD);
    return ans;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'id': id,
      'audio_url': audioUrl,
      'picture_url': pictureUrl,
      'correct_ans': correctAns,
      'transcript_a': transcriptA,
      'transcript_b': transcriptB,
      'transcript_c': transcriptC,
      'transcript_d': transcriptD,
    };
  }

  factory PartOneDto.fromMap(Map<String, dynamic> map) {
    return PartOneDto(
      number: map['number'] as int,
      id: map['id'] as String,
      audioUrl: map['audio_url'] as String,
      pictureUrl: map['picture_url'] as String,
      correctAns: map['correct_ans'] as String,
      transcriptA: map['transcript_a'] as String,
      transcriptB: map['transcript_b'] as String,
      transcriptC: map['transcript_c'] as String,
      transcriptD: map['transcript_d'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory PartOneDto.fromJson(String source) =>
      PartOneDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
