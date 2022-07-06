// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoDto implements BaseDto<PartTwoModel> {
  int number;
  String id;
  String audioUrl;
  String correctAns;
  String question;
  String transcriptA;
  String transcriptB;
  String transcriptC;

  PartTwoDto({
    required this.number,
    required this.id,
    required this.audioUrl,
    required this.correctAns,
    required this.question,
    required this.transcriptA,
    required this.transcriptB,
    required this.transcriptC,
  });

  @override
  PartTwoModel toBusinessModel() {
    return PartTwoModel(
      number: number,
      id: id,
      audioPath: audioUrl,
      question: question,
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
    }
    return Answer.values[idx];
  }

  List<String> _ansStrToList() {
    List<String> ans = [];
    ans.add(transcriptA);
    ans.add(transcriptB);
    ans.add(transcriptC);
    return ans;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'id': id,
      'audio_url': audioUrl,
      'question': question,
      'correct_ans': correctAns,
      'transcript_a': transcriptA,
      'transcript_b': transcriptB,
      'transcript_c': transcriptC,
    };
  }

  factory PartTwoDto.fromMap(Map<String, dynamic> map) {
    return PartTwoDto(
      number: map['number'] as int,
      id: map['id'] as String,
      audioUrl: map['audio_url'] as String,
      question: map['question'] as String,
      correctAns: map['correct_ans'] as String,
      transcriptA: map['transcript_a'] as String,
      transcriptB: map['transcript_b'] as String,
      transcriptC: map['transcript_c'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory PartTwoDto.fromJson(String source) =>
      PartTwoDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
