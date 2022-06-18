import 'dart:developer';

import '../../../../core_utils/global_configuration.dart';
import 'package:hive/hive.dart';
import '../../../business_models/execute_models/part_two_model.dart';
import '../../hive_objects/part_execute_hive_object/part_two_hive_object.dart';
import '../box_name.dart';
import '../base_dao/base_dao.dart';

const _logTag = "PartTwoDAO";

class PartTwoDao implements BaseDao<PartTwoModel, PartTwoHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_TWO_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partTwoBox = Hive.box(BoxName.PART_TWO_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() partTwoBox.length: ${partTwoBox.length}");
    }

    await partTwoBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() partTwoBox put dtwo");
    return true;
  }

  @override
  Future<List<PartTwoModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartTwoModel> partTwoModelList = [];
    try {
      await Hive.openBox(BoxName.PART_TWO_BOX_NAME);
    } catch (e) {
      return partTwoModelList;
    }
    final partTwoBox = Hive.box(BoxName.PART_TWO_BOX_NAME);
    if (logEnable) log("$_logTag getAllItems() trying get partTwo...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() partTwoHiveId: $hiveId");
      final partTwoHiveObjectList = partTwoBox.get(hiveId, defaultValue: null);
      if (partTwoHiveObjectList == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partTwoHiveObjectList");
      }
      final partTwoInfoModel = PartTwoModel.fromHiveObject(
          partTwoHiveObjectList as PartTwoHiveObject);
      partTwoModelList.add(partTwoInfoModel);
    }
    return partTwoModelList;
  }

  @override
  Future<PartTwoModel?> query(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_TWO_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partTwoBox = Hive.box(BoxName.PART_TWO_BOX_NAME);
    final partTwoHiveObject = partTwoBox.get(hiveId, defaultValue: null);
    return PartTwoModel.fromHiveObject(partTwoHiveObject);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_TWO_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partTwoBox = Hive.box(BoxName.PART_TWO_BOX_NAME);
    await partTwoBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
