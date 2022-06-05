import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';

import 'package:hive/src/object/hive_object.dart';

import '../../business_models/part_info_model.dart';
import '../hive_objects/part_hive_object/part_hive_object.dart';
import 'base_dao.dart';

class PartDAO implements BaseDAO<PartInfoModel, PartHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    return await getFakeList();
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<PartInfoModel>> getFakeList() async {
    List<PartInfoModel> list = [];
    list.add(PartInfoModel(
      partType: PartType.part1,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part2,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part3,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part4,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part5,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part6,
      numOfCorrect: 2,
    ));
    list.add(PartInfoModel(
      partType: PartType.part7,
      numOfCorrect: 2,
    ));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}