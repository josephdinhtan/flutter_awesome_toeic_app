import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/utils/misc.dart';
import 'package:hive/hive.dart';

import 'package:hive/src/object/hive_object.dart';

import '../../business_models/part_info_model.dart';
import '../box_name.dart';
import '../hive_objects/part_hive_object/part_hive_object.dart';
import 'base_dao.dart';

const _logTag = "PartDAO";

class PartDAO implements BaseDAO<PartInfoModel, PartHiveObject> {
  static final PartDAO _singleton = PartDAO._internal();
  PartDAO._internal();
  factory PartDAO() => _singleton;

  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (DebugLogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (DebugLogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_BOX_NAME);
      if (DebugLogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (DebugLogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partBox = Hive.box(BoxName.PART_BOX_NAME);
    if (DebugLogEnable) {
      log("$_logTag addItem() partBox.length: ${partBox.length}");
    }
    await partBox.put(hiveId, item);
    if (DebugLogEnable) log("$_logTag addItem() partBox put done");
    return true;
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    if (DebugLogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartInfoModel> partInfoModelList = [];
    try {
      await Hive.openBox(BoxName.PART_BOX_NAME);
    } catch (e) {
      return partInfoModelList;
    }
    final partBox = Hive.box(BoxName.PART_BOX_NAME);
    if (DebugLogEnable) log("$_logTag getAllItems() trying get parts...");
    for (String hiveId in hiveIds) {
      if (DebugLogEnable) log("$_logTag getAllItems() partHiveId: $hiveId");
      final partHiveObjectList = partBox.get(hiveId, defaultValue: null);
      if (partHiveObjectList == null) break;
      if (DebugLogEnable) {
        log("$_logTag getAllItems() partHiveObjectList: $partHiveObjectList");
      }
      final partInfoModel =
          PartInfoModel.fromHiveObject(partHiveObjectList as PartHiveObject);
      partInfoModelList.add(partInfoModel);
    }
    if (DebugLogEnable)
      log("$_logTag getAllItems() get from DB done items.length: ${partInfoModelList.length}");
    return partInfoModelList;
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partBox = Hive.box(BoxName.PART_BOX_NAME);
    final partHiveObject = partBox.get(hiveId, defaultValue: null);
    return PartInfoModel.fromHiveObject(partHiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partBox = Hive.box(BoxName.PART_BOX_NAME);
    await partBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  // Future<List<PartInfoModel>> getFakeList() async {
  //   List<PartInfoModel> list = [];
  //   list.add(PartInfoModel(
  //     partType: PartType.part1,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part2,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part3,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part4,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part5,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part6,
  //     numOfCorrect: 2,
  //   ));
  //   list.add(PartInfoModel(
  //     partType: PartType.part7,
  //     numOfCorrect: 2,
  //   ));

  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Future.value(list);
  // }
}
