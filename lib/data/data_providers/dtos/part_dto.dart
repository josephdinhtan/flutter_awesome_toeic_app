// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../business_models/part_model.dart';
import 'base_dto/base_dto.dart';

class PartDto implements BaseDto<PartModel> {
  String title;
  String id;
  int numOfQuestion;
  int? numOfCorrect;
  int ver;
  List<String> questionIds;

  PartDto({
    required this.title,
    required this.id,
    required this.numOfQuestion,
    required this.numOfCorrect,
    required this.questionIds,
    required this.ver,
  });

  @override
  PartModel toBusinessModel() {
    return PartModel(
      title: title,
      id: id,
      partType: _getPartType(),
      numOfCorrect: numOfCorrect,
      numOfQuestion: numOfQuestion,
      questionIds: questionIds,
      ver: ver,
    );
  }

  PartType _getPartType() {
    String partStr = title.split(" ")[1];
    int partInt = int.parse(partStr);
    return PartType.values[(partInt - 1)];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'num_of_question': numOfQuestion,
      'num_of_correct': numOfCorrect,
      'question_ids': questionIds,
      'ver': ver,
    };
  }

  factory PartDto.fromMap(Map<String, dynamic> map) {
    return PartDto(
      title: map['title'] as String,
      id: map['id'] as String,
      numOfQuestion: map['num_of_question'] as int,
      numOfCorrect:
          map['num_of_correct'] != null ? map['num_of_correct'] as int : null,
      ver: map['ver'] as int,
      questionIds: List<String>.from((map['question_ids'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PartDto.fromJson(String source) =>
      PartDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
