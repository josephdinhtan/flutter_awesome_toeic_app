import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core_utils/global_configuration.dart';
import '../../../business_models/execute_models/part_one_model.dart';
import '../../hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import '../base_dao/base_dao.dart';
import '../box_name.dart';

const _logTag = "PartOneDAO";

class PartOneDao implements BaseDao<PartOneModel, PartOneHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_ONE_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partOneBox = Hive.box(BoxName.PART_ONE_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() partOneBox.length: ${partOneBox.length}");
    }

    await partOneBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() partOneBox put done");
    return true;
  }

  @override
  Future<List<PartOneModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartOneModel> partOneModelList = [];
    try {
      await Hive.openBox(BoxName.PART_ONE_BOX_NAME);
    } catch (e) {
      return partOneModelList;
    }
    final partOneBox = Hive.box(BoxName.PART_ONE_BOX_NAME);
    if (logEnable) log("$_logTag getAllItems() trying get partOne...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() partOneHiveId: $hiveId");
      final partOneHiveObjectList = partOneBox.get(hiveId, defaultValue: null);
      if (partOneHiveObjectList == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partOneHiveObjectList");
      }
      final partOneInfoModel = PartOneModel.fromHiveObject(
          partOneHiveObjectList as PartOneHiveObject);
      partOneModelList.add(partOneInfoModel);
    }
    return partOneModelList;
  }

  @override
  Future<PartOneModel?> query(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_ONE_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partOneBox = Hive.box(BoxName.PART_ONE_BOX_NAME);
    final partOneHiveObject = partOneBox.get(hiveId, defaultValue: null);
    return PartOneModel.fromHiveObject(partOneHiveObject);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_ONE_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partOneBox = Hive.box(BoxName.PART_ONE_BOX_NAME);
    await partOneBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
