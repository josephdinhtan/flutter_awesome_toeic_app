import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../core_utils/global_configuration.dart';
import '../../business_models/question_note_model.dart';
import '../hive_objects/question_note_hive_object/question_note_hive_object.dart';
import 'base_dao/base_dao.dart';
import 'box_name.dart';

const _logTag = "QuestionNoteDAO";

class QuestionNoteDao
    implements BaseDao<QuestionNoteModel, QuestionNoteHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    if (logEnable) log("$_logTag addItem() item: $item, hiveId: $hiveId");
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.QUESTION_NOTE_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final questionNoteBox = Hive.box(BoxName.QUESTION_NOTE_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() questionNoteBox.length: ${questionNoteBox.length}");
    }

    await questionNoteBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() questionNoteBox put done");
    return true;
  }

  @override
  Future<List<QuestionNoteModel>> queryAll(List<String> hiveIds) async {
    List<QuestionNoteModel> questionNoteInfoModelList = [];
    try {
      await Hive.openBox(BoxName.QUESTION_NOTE_BOX_NAME);
    } catch (e) {
      return questionNoteInfoModelList;
    }
    final questionNoteBox = Hive.box(BoxName.QUESTION_NOTE_BOX_NAME);
    for (int i = 0; i < questionNoteBox.length; i++) {
      questionNoteInfoModelList.add(QuestionNoteModel.fromHiveObject(
          questionNoteBox.getAt(i) as QuestionNoteHiveObject));
    }
    return questionNoteInfoModelList;
  }

  @override
  Future<QuestionNoteModel?> query(String hiveId) async {
    //if (logEnable) log("$_logTag query() hiveId $hiveId");
    try {
      await Hive.openBox(BoxName.QUESTION_NOTE_BOX_NAME);
    } catch (e) {
      return null;
    }
    final questionNoteBox = Hive.box(BoxName.QUESTION_NOTE_BOX_NAME);
    final questionNoteHiveObject =
        questionNoteBox.get(hiveId, defaultValue: null);
    if (questionNoteHiveObject == null) return null;
    return QuestionNoteModel.fromHiveObject(questionNoteHiveObject);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(BoxName.QUESTION_NOTE_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final questionNoteBox = Hive.box(BoxName.QUESTION_NOTE_BOX_NAME);
    await questionNoteBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    throw UnimplementedError();
  }
}
