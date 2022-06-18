import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core_utils/global_configuration.dart';
import '../../../business_models/execute_models/part_four_model.dart';
import '../../hive_objects/part_execute_hive_object/part_four_hive_object.dart';
import '../base_dao/base_dao.dart';
import '../box_name.dart';

const _logTag = "PartFourDAO";

class PartFourDao implements BaseDao<PartFourModel, PartFourHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() partFourBox.length: ${partFourBox.length}");
    }

    await partFourBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() partFourBox put dfour");
    return true;
  }

  @override
  Future<List<PartFourModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartFourModel> partFourModelList = [];
    try {
      await Hive.openBox(BoxName.PART_FOUR_BOX_NAME);
    } catch (e) {
      return partFourModelList;
    }
    final partFourBox = Hive.box(BoxName.PART_FOUR_BOX_NAME);
    if (logEnable) log("$_logTag getAllItems() trying get partFour...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() partFourHiveId: $hiveId");
      final partFourHiveObjectList =
          partFourBox.get(hiveId, defaultValue: null);
      if (partFourHiveObjectList == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partFourHiveObjectList");
      }
      final partFourInfoModel = PartFourModel.fromHiveObject(
          partFourHiveObjectList as PartFourHiveObject);
      partFourModelList.add(partFourInfoModel);
    }
    return partFourModelList;
  }

  @override
  Future<PartFourModel?> query(String hiveId) async {
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
  Future<bool> delete(String hiveId) async {
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
  Future<bool> update(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
