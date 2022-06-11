import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/base_dao.dart';
import 'package:hive/hive.dart';

import '../../business_models/test_info_model.dart';
import '../box_name.dart';
import '../hive_objects/test_hive_object/test_hive_object.dart';

const LOG_TAG = "TestDAO";
final logEnable = false;

class TestDAO implements BaseDAO<TestInfoModel, TestHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (logEnable) log("$LOG_TAG addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$LOG_TAG addItem() openBox started");
      await Hive.openBox(BoxName.TEST_BOX_NAME);
      if (logEnable) log("$LOG_TAG addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$LOG_TAG addItem() ${e.toString()}");
      return false;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (logEnable) log("$LOG_TAG addItem() testBox.length: ${testBox.length}");
    // hiveId should be farther ID, bookId
    await testBox.put(hiveId, item);
    if (logEnable) log("$LOG_TAG addItem() testBox put done");
    return true;
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    if (logEnable) log("$LOG_TAG getAllItems() hiveId: $hiveIds");
    List<TestInfoModel> testInfoModelList = [];
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return testInfoModelList;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (logEnable) log("$LOG_TAG getAllItems() trying get test...");
    for (String hiveId in hiveIds) {
      if (logEnable) log("$LOG_TAG getAllItems() testHiveId: $hiveId");
      final testHiveObjectList = testBox.get(hiveId, defaultValue: null);
      if (testHiveObjectList == null) break;
      if (logEnable)
        log("$LOG_TAG getAllItems() testHiveObjectList: $testHiveObjectList");
      final testInfoModel = TestInfoModel.fromHiveObject(testHiveObjectList as TestHiveObject);
      testInfoModel.hiveId = hiveId;
      testInfoModelList.add(testInfoModel);
    }
    return testInfoModelList;
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return null;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    final testHiveObject = testBox.get(hiveId, defaultValue: null);
    return TestInfoModel.fromHiveObject(testHiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    throw UnimplementedError();
  }

  Future<List<TestInfoModel>> getFakeList() async {
    List<TestInfoModel> list = [];
    list.add(TestInfoModel(
        title: 'Practice Test 1',
        memorySize: '',
        questionNumber: 200,
        version: 1,
        isDownloaded: true,
        actualScore: 730,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 2',
        memorySize: '35.5M',
        questionNumber: 200,
        isDownloaded: true,
        actualScore: 615,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 3',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 4',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 5',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 6',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 7',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 8',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 9',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 10',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}
