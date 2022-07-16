// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import '../data_providers/hive_objects/part_hive_object/part_hive_object.dart';
import 'base_model/base_business_model.dart';

class PartModel implements BaseBusinessModel {
  final PartType partType;
  final String title;
  final String id;
  final int numOfQuestion;
  int numOfCorrect;
  final int ver;
  final List<String> questionIds;

  PartModel({
    required this.partType,
    required this.title,
    required this.id,
    required this.numOfQuestion,
    required this.numOfCorrect,
    required this.ver,
    required this.questionIds,
  });

  HiveObject toHiveObject() {
    return PartHiveObject(
      id: id,
      title: title,
      partType: partType.index,
      numOfQuestion: numOfQuestion,
      questionIds: questionIds,
      ver: ver,
      numOfCorrect: numOfCorrect,
    );
  }

  factory PartModel.fromHiveObject(PartHiveObject hiveObject) {
    return PartModel(
      id: hiveObject.id,
      numOfCorrect: hiveObject.numOfCorrect,
      numOfQuestion: hiveObject.numOfQuestion,
      partType: PartType.values[hiveObject.partType],
      questionIds: hiveObject.questionIds,
      title: hiveObject.title,
      ver: hiveObject.ver,
    );
  }
}

enum PartType { part1, part2, part3, part4, part5, part6, part7 }
