// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'base_dto/base_dto.dart';

import '../../business_models/test_model.dart';

class TestDto implements BaseDto<TestModel> {
  String title;
  String id;
  String memorySize;
  int numOfQuestion;
  int? actualScore;
  String pictureUrl;
  String audioUrl;
  String partUrl;
  int ver;
  List<String> partIds;
  TestDto({
    required this.title,
    required this.id,
    required this.memorySize,
    required this.numOfQuestion,
    required this.actualScore,
    required this.pictureUrl,
    required this.audioUrl,
    required this.partUrl,
    required this.ver,
    required this.partIds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'memory_size': memorySize,
      'num_of_question': numOfQuestion,
      'actual_score': actualScore,
      'pictures_url': pictureUrl,
      'audios_url': audioUrl,
      'parts_url': partUrl,
      'ver': ver,
      'part_ids': partIds,
    };
  }

  factory TestDto.fromMap(Map<String, dynamic> map) {
    return TestDto(
      title: map['title'] as String,
      id: map['id'] as String,
      memorySize: map['memory_size'] as String,
      numOfQuestion: map['num_of_question'] as int,
      actualScore:
          map['actual_score'] != null ? map['actual_score'] as int : null,
      pictureUrl: map['pictures_url'] as String,
      audioUrl: map['audios_url'] as String,
      partUrl: map['parts_url'] as String,
      ver: map['ver'] as int,
      partIds: List<String>.from((map['part_ids'] as List<dynamic>)),
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
      memorySize: memorySize,
      numOfQuestion: numOfQuestion,
      ver: ver,
      picturePath: pictureUrl,
      partIds: partIds,
      actualScore: actualScore,
      audioPath: audioUrl,
    );
  }
}
