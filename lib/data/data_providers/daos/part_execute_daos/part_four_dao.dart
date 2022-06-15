import 'dart:developer';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:hive/hive.dart';
import '../../../business_models/execute_models/part_four_model.dart';
import '../../hive_objects/part_execute_hive_object/part_four_hive_object.dart';
import '../box_name.dart';
import '../base_dao/base_dao.dart';

const _logTag = "PartFourDAO";

class PartFourDao implements BaseDao<PartFourModel, PartFourHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (LogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (LogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
      if (LogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (LogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    if (LogEnable) {
      log("$_logTag addItem() partFourBox.length: ${partFourBox.length}");
    }

    await partFourBox.put(hiveId, item);
    if (LogEnable) log("$_logTag addItem() partFourBox put dfour");
    return true;
  }

  @override
  Future<List<PartFourModel>> getAllItems(List<String> hiveIds) async {
    if (LogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartFourModel> partFourModelList = [];
    try {
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
    } catch (e) {
      return partFourModelList;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    if (LogEnable) log("$_logTag getAllItems() trying get partFour...");
    for (String hiveId in hiveIds) {
      if (LogEnable) log("$_logTag getAllItems() partFourHiveId: $hiveId");
      final partFourHiveObjectList =
          partFourBox.get(hiveId, defaultValue: null);
      if (partFourHiveObjectList == null) break;
      if (LogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partFourHiveObjectList");
      }
      final partFourInfoModel = PartFourModel.fromHiveObject(
          partFourHiveObjectList as PartFourHiveObject);
      partFourModelList.add(partFourInfoModel);
    }
    return partFourModelList;
  }

  @override
  Future<PartFourModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    final partFourHiveObject = partFourBox.get(hiveId, defaultValue: null);
    return PartFourModel.fromHiveObject(partFourHiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    await partFourBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
