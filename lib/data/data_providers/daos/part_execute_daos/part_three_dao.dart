import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core_utils/global_configuration.dart';
import '../../../business_models/execute_models/part_three_model.dart';
import '../../hive_objects/part_execute_hive_object/part_three_hive_object.dart';
import '../base_dao/base_dao.dart';
import '../box_name.dart';

const _logTag = "PartThreeDAO";

class PartThreeDao implements BaseDao<PartThreeModel, PartThreeHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() partThreeBox.length: ${partThreeBox.length}");
    }

    await partThreeBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() partThreeBox put dthree");
    return true;
  }

  @override
  Future<List<PartThreeModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartThreeModel> partThreeModelList = [];
    try {
      await Hive.openBox(BoxName.PART_THREE_BOX_NAME);
    } catch (e) {
      return partThreeModelList;
    }
    final partThreeBox = Hive.box(BoxName.PART_THREE_BOX_NAME);
    if (logEnable) log("$_logTag getAllItems() trying get partThree...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() partThreeHiveId: $hiveId");
      final partThreeHiveObjectList =
          partThreeBox.get(hiveId, defaultValue: null);
      if (partThreeHiveObjectList == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partThreeHiveObjectList");
      }
      final partThreeInfoModel = PartThreeModel.fromHiveObject(
          partThreeHiveObjectList as PartThreeHiveObject);
      partThreeModelList.add(partThreeInfoModel);
    }
    return partThreeModelList;
  }

  @override
  Future<PartThreeModel?> query(String hiveId) async {
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
  Future<bool> delete(String hiveId) async {
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
  Future<bool> update(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
