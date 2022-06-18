import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../core_utils/global_configuration.dart';
import '../../business_models/test_model.dart';
import '../hive_objects/test_hive_object/test_hive_object.dart';
import 'base_dao/base_dao.dart';
import 'box_name.dart';

const _logTag = "TestDAO";

class TestDao implements BaseDao<TestModel, TestHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.TEST_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() testBox.length: ${testBox.length}");
    }

    await testBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() testBox put done");
    return true;
  }

  @override
  Future<List<TestModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<TestModel> testInfoModelList = [];
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return testInfoModelList;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (logEnable) log("$_logTag getAllItems() trying get test...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() testHiveId: $hiveId");
      final testHiveObjectList = testBox.get(hiveId, defaultValue: null);
      if (testHiveObjectList == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $testHiveObjectList");
      }
      final testInfoModel =
          TestModel.fromHiveObject(testHiveObjectList as TestHiveObject);
      testInfoModelList.add(testInfoModel);
    }
    return testInfoModelList;
  }

  @override
  Future<TestModel?> query(String hiveId) async {
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return null;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    final testHiveObject = testBox.get(hiveId, defaultValue: null);
    return TestModel.fromHiveObject(testHiveObject);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    await testBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    throw UnimplementedError();
  }
}
