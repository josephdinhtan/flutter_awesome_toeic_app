import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core_utils/global_configuration.dart';
import '../../business_models/question_group_model.dart';
import '../hive_objects/part_execute_hive_object/question_group_hive.dart';
import 'base_dao/base_dao.dart';
import 'box_name.dart';

const _logTag = "QuestionGroupDao";
const _boxName = BoxName.QUESTION_GROUP_BOX_NAME;

class QuestionGroupDao
    implements BaseDao<QuestionGroupModel, QuestionGroupHive> {
  @override
  Future<bool> insert(QuestionGroupHive item, String hiveId) async {
    if (logEnable) log("$_logTag insert() hiveId: $hiveId");
    try {
      await Hive.openBox(_boxName);
    } catch (e) {
      if (logEnable) log("$_logTag insert() Exception: ${e.toString()}");
      return false;
    }
    final questionGroupBox = Hive.box(_boxName);
    if (logEnable) {
      log("$_logTag insert() questionGroupBox.length: ${questionGroupBox.length}");
    }
    await questionGroupBox.put(hiveId, item);
    return true;
  }

  @override
  Future<List<QuestionGroupModel>> queryAll(List<String> hiveIds) async {
    if (logEnable) log("$_logTag queryAll() hiveId: $hiveIds");
    List<QuestionGroupModel> questionGroupModels = [];
    try {
      await Hive.openBox(_boxName);
    } catch (e) {
      return questionGroupModels;
    }
    final questionGroupBox = Hive.box(_boxName);
    for (String hiveId in hiveIds) {
      if (logEnable) log("$_logTag getAllItems() partOneHiveId: $hiveId");
      final questionGroupHives =
          questionGroupBox.get(hiveId, defaultValue: null);
      if (questionGroupHives == null) break;
      if (logEnable) {
        log("$_logTag getAllItems() questionGroupHives: $questionGroupHives");
      }
      final questionGroupModel = QuestionGroupModel.fromHiveObject(
          questionGroupHives as QuestionGroupHive);
      questionGroupModels.add(questionGroupModel);
    }
    return questionGroupModels;
  }

  @override
  Future<QuestionGroupModel?> query(String hiveId) async {
    try {
      await Hive.openBox(_boxName);
    } catch (e) {
      return null;
    }
    final questionGroupBox = Hive.box(_boxName);
    final questionGroupHive = questionGroupBox.get(hiveId, defaultValue: null);
    return QuestionGroupModel.fromHiveObject(questionGroupHive);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(_boxName);
    } catch (e) {
      log("$_logTag delete() ${e.toString()}");
      return false;
    }
    final questionGroupBox = Hive.box(_boxName);
    await questionGroupBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
