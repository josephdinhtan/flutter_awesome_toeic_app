import 'dart:developer';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:hive/hive.dart';
import '../../../business_models/execute_models/part_three_model.dart';
import '../../hive_objects/part_execute_hive_object/part_three_hive_object.dart';
import '../box_name.dart';
import '../base_dao/base_dao.dart';

const _logTag = "PartThreeDAO";

class PartThreeDao implements BaseDao<PartThreeModel, PartThreeHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (LogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (LogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
      if (LogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (LogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    if (LogEnable) {
      log("$_logTag addItem() partThreeBox.length: ${partThreeBox.length}");
    }

    await partThreeBox.put(hiveId, item);
    if (LogEnable) log("$_logTag addItem() partThreeBox put dthree");
    return true;
  }

  @override
  Future<List<PartThreeModel>> getAllItems(List<String> hiveIds) async {
    if (LogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartThreeModel> partThreeModelList = [];
    try {
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
    } catch (e) {
      return partThreeModelList;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    if (LogEnable) log("$_logTag getAllItems() trying get partThree...");
    for (String hiveId in hiveIds) {
      if (LogEnable) log("$_logTag getAllItems() partThreeHiveId: $hiveId");
      final partThreeHiveObjectList =
          partThreeBox.get(hiveId, defaultValue: null);
      if (partThreeHiveObjectList == null) break;
      if (LogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partThreeHiveObjectList");
      }
      final partThreeInfoModel = PartThreeModel.fromHiveObject(
          partThreeHiveObjectList as PartThreeHiveObject);
      partThreeModelList.add(partThreeInfoModel);
    }
    return partThreeModelList;
  }

  @override
  Future<PartThreeModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
    } catch (e) {
      return null;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    final partThreeHiveObject = partThreeBox.get(hiveId, defaultValue: null);
    return PartThreeModel.fromHiveObject(partThreeHiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    await partThreeBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
