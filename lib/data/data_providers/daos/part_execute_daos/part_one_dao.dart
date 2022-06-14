import 'dart:developer';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:hive/hive.dart';
import '../../../business_models/execute_models/part_one_model.dart';
import '../box_name.dart';
import '../../hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import '../base_dao/base_dao.dart';

const _logTag = "PartOneDAO";

class PartOneDao implements BaseDao<PartOneModel, PartOneHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (LogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (LogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
      if (LogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (LogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    if (LogEnable) {
      log("$_logTag addItem() partOneBox.length: ${partOneBox.length}");
    }

    await partOneBox.put(hiveId, item);
    if (LogEnable) log("$_logTag addItem() partOneBox put done");
    return true;
  }

  @override
  Future<List<PartOneModel>> getAllItems(List<String> hiveIds) async {
    if (LogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartOneModel> partOneModelList = [];
    try {
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
    } catch (e) {
      return partOneModelList;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    if (LogEnable) log("$_logTag getAllItems() trying get partOne...");
    for (String hiveId in hiveIds) {
      if (LogEnable) log("$_logTag getAllItems() partOneHiveId: $hiveId");
      final partOneHiveObjectList = partOneBox.get(hiveId, defaultValue: null);
      if (partOneHiveObjectList == null) break;
      if (LogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partOneHiveObjectList");
      }
      final partOneInfoModel = PartOneModel.fromHiveObject(
          partOneHiveObjectList as PartOneHiveObject);
      partOneModelList.add(partOneInfoModel);
    }
    return partOneModelList;
  }

  @override
  Future<PartOneModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    final partOneHiveObject = partOneBox.get(hiveId, defaultValue: null);
    return PartOneModel.fromHiveObject(partOneHiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    await partOneBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
