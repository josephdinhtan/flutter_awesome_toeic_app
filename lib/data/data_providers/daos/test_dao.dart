import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:hive/hive.dart';

import '../../../core_utils/global_configuration.dart';
import '../../business_models/test_model.dart';
import 'box_name.dart';
import '../hive_objects/test_hive_object/test_hive_object.dart';

const _logTag = "TestDAO";

class TestDao implements BaseDao<TestModel, TestHiveObject> {
  static final TestDao _singleton = TestDao._internal();
  TestDao._internal();
  factory TestDao() => _singleton;

  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (LogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (LogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.TEST_BOX_NAME);
      if (LogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (LogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (LogEnable) {
      log("$_logTag addItem() testBox.length: ${testBox.length}");
    }

    await testBox.put(hiveId, item);
    if (LogEnable) log("$_logTag addItem() testBox put done");
    return true;
  }

  @override
  Future<List<TestModel>> getAllItems(List<String> hiveIds) async {
    if (LogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<TestModel> testInfoModelList = [];
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return testInfoModelList;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (LogEnable) log("$_logTag getAllItems() trying get test...");
    for (String hiveId in hiveIds) {
      if (LogEnable) log("$_logTag getAllItems() testHiveId: $hiveId");
      final testHiveObjectList = testBox.get(hiveId, defaultValue: null);
      if (testHiveObjectList == null) break;
      if (LogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $testHiveObjectList");
      }
      final testInfoModel =
          TestModel.fromHiveObject(testHiveObjectList as TestHiveObject);
      testInfoModelList.add(testInfoModel);
    }
    return testInfoModelList;
  }

  @override
  Future<TestModel?> getItem(String hiveId) async {
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
  Future<bool> removeItem(String hiveId) async {
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
  Future<bool> updateItem(HiveObject item) {
    throw UnimplementedError();
  }
}
