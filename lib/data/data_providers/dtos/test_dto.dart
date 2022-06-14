// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';
import '../../business_models/test_model.dart';

class TestDto implements BaseDto<TestModel> {
  String title;
  String id;
  String memory_size;
  int num_of_question;
  int? actual_score;
  String pictures_url;
  String audios_url;
  String parts_url;
  int ver;
  List<String> part_ids;
  TestDto({
    required this.title,
    required this.id,
    required this.memory_size,
    required this.num_of_question,
    required this.actual_score,
    required this.pictures_url,
    required this.audios_url,
    required this.parts_url,
    required this.ver,
    required this.part_ids,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'memory_size': memory_size,
      'num_of_question': num_of_question,
      'actual_score': actual_score,
      'pictures_url': pictures_url,
      'audios_url': audios_url,
      'parts_url': parts_url,
      'ver': ver,
      'part_ids': part_ids,
    };
  }

  factory TestDto.fromMap(Map<String, dynamic> map) {
    return TestDto(
      title: map['title'] as String,
      id: map['id'] as String,
      memory_size: map['memory_size'] as String,
      num_of_question: map['num_of_question'] as int,
      actual_score:
          map['actual_score'] != null ? map['actual_score'] as int : null,
      pictures_url: map['pictures_url'] as String,
      audios_url: map['audios_url'] as String,
      parts_url: map['parts_url'] as String,
      ver: map['ver'] as int,
      part_ids: List<String>.from((map['part_ids'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestDto.fromJson(String source) =>
      TestDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  TestModel toBusinessModel() {
    return TestModel(
      id: id,
      title: title,
      memorySize: memory_size,
      numOfQuestion: num_of_question,
      ver: ver,
      picturePath: pictures_url,
      partIds: part_ids,
      actualScore: actual_score,
      audioPath: audios_url,
    );
  }
}
