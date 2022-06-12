// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import '../../business_models/test_info_model.dart';
import '../../data_source/hive_objects/test_hive_object/test_hive_object.dart';
import 'base_network_object/network_base_object.dart';

class TestNetworkObject implements NetworkBaseObject<TestInfoModel> {
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
  TestNetworkObject({
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

  factory TestNetworkObject.fromMap(Map<String, dynamic> map) {
    return TestNetworkObject(
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

  factory TestNetworkObject.fromJson(String source) =>
      TestNetworkObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  TestInfoModel toBusinessModel() {
    return TestInfoModel(
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
