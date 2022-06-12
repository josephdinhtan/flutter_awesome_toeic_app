import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/business_models/part_models/part_five_model.dart';
import 'package:flutter_toeic_quiz2/data/business_models/part_models/part_one_model.dart';
import 'package:hive/hive.dart';

import '../../../../utils/misc.dart';
import '../../../business_models/part_models/answer_enum.dart';
import '../../box_name.dart';
import '../../hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import '../base_dao.dart';

const _logTag = "PartOneDAO";

class PartOneDAO implements BaseDAO<PartFiveModel, PartOneHiveObject> {
  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    if (DebugLogEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (DebugLogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
      if (DebugLogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (DebugLogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    if (DebugLogEnable) {
      log("$_logTag addItem() partOneBox.length: ${partOneBox.length}");
    }

    await partOneBox.put(hiveId, item);
    if (DebugLogEnable) log("$_logTag addItem() partOneBox put done");
    return true;
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    if (DebugLogEnable) log("$_logTag getAllItems() hiveId: $hiveIds");
    List<PartOneModel> partOneModelList = [];
    try {
      await Hive.openBox(BoxName.PART_ONCE_BOX_NAME);
    } catch (e) {
      return partOneModelList;
    }
    final partOneBox = Hive.box(BoxName.PART_ONCE_BOX_NAME);
    if (DebugLogEnable) log("$_logTag getAllItems() trying get partOne...");
    for (String hiveId in hiveIds) {
      if (DebugLogEnable) log("$_logTag getAllItems() partOneHiveId: $hiveId");
      final partOneHiveObjectList = partOneBox.get(hiveId, defaultValue: null);
      if (partOneHiveObjectList == null) break;
      if (DebugLogEnable) {
        log("$_logTag getAllItems() testHiveObjectList: $partOneHiveObjectList");
      }
      final partOneInfoModel = PartOneModel.fromHiveObject(
          partOneHiveObjectList as PartOneHiveObject);
      partOneModelList.add(partOneInfoModel);
    }
    return partOneModelList;
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) async {
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

  Future<List<PartFiveModel>> getFakeQuestionList() async {
    final List<PartFiveModel> demoResult = [];

    demoResult.add(PartFiveModel(
      questionNumber: 1,
      question: 'Question demo 1',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 2,
      question: 'Question demo 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 3,
      question: 'Question demo 3',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 4,
      question: 'Question demo 4',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 5,
      question: 'Question demo 5',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 6,
      question: 'Question demo 6',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
