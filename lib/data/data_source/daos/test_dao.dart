import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/base_dao.dart';
import 'package:flutter_toeic_quiz2/utils/misc.dart';
import 'package:hive/hive.dart';

import '../../business_models/test_info_model.dart';
import '../box_name.dart';
import '../hive_objects/test_hive_object/test_hive_object.dart';

const _logTag = "TestDAO";

class TestDAO implements BaseDAO<TestInfoModel, TestHiveObject> {
  static final TestDAO _singleton = TestDAO._internal();
  TestDAO._internal();
  factory TestDAO() => _singleton;

  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (DebugLogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (DebugLogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.TEST_BOX_NAME);
      if (DebugLogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (DebugLogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (DebugLogEnable) {
      log("$_logTag addItem() testBox.length: ${testBox.length}");
    }

    await testBox.put(hiveId, item);
    if (DebugLogEnable) log("$_logTag addItem() testBox put done");
    return true;
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    if (DebugLogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<TestInfoModel> testInfoModelList = [];
    try {
      await Hive.openBox(BoxName.TEST_BOX_NAME);
    } catch (e) {
      return testInfoModelList;
    }
    final testBox = Hive.box(BoxName.TEST_BOX_NAME);
    if (DebugLogEnable) log("$_logTag getAllItems() trying get test...");
    for (String hiveId in hiveIds) {
      if (DebugLogEnable) log("$_logTag getAllItems() testHiveId: $hiveId");
      final testHiveObjectList = testBox.get(hiveId, defaultValue: null);
      if (testHiveObjectList == null) break;
      if (DebugLogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $testHiveObjectList");
      }
      final testInfoModel =
          TestInfoModel.fromHiveObject(testHiveObjectList as TestHiveObject);
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

  // Future<List<TestsInfoModel>> getFakeList() async {
  //   List<TestsInfoModel> list = [];
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 1',
  //       memorySize: '',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       isResourceDownloaded: true,
  //       actualScore: 730,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 2',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       isResourceDownloaded: true,
  //       actualScore: 615,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 3',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 4',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 5',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 6',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 7',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 8',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 9',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 10',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));

  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Future.value(list);
  // }
}
