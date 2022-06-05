import 'dart:developer';
import 'package:flutter_toeic_quiz2/data/data_source/hive_objects/book_hive_object/book_hive_object.dart';

import '../../business_models/book_info_model.dart';
import '../daos/base_dao.dart';
import '../box_name.dart';
import 'package:hive/hive.dart';

const logEnable = true;
const LOG_TAG = "BookDAO";

class BookDAO implements BaseDAO<BookInfoModel, BookHiveObject> {

  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    try {
      if(logEnable) log("$LOG_TAG addItem() openBox started");
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
      if(logEnable) log("$LOG_TAG addItem() openBox done");
    } catch (e) {
      if(logEnable) log("$LOG_TAG addItem() ${e.toString()}");
      return false;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    if(logEnable) log("$LOG_TAG addItem() bookBox.length: ${bookBox.length}");
    await bookBox.put(hiveId, item);
    if(logEnable) log("$LOG_TAG addItem() bookBox put done");
    return true;
  }

  @override
  Future<BookInfoModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      log("$LOG_TAG getItem() ${e.toString()}");
      return null;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    final hiveObject = await bookBox.get(hiveId, defaultValue: null) as BookHiveObject;
    return BookInfoModel.fromHiveObject(hiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      log("$LOG_TAG removeItem() ${e.toString()}");
      return false;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    await bookBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> updateItem(HiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<List<BookInfoModel>> getAllItems(List<String> hiveIds) async {
    List<BookInfoModel> bookInfoModelList = [];
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      return bookInfoModelList;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    for(int i = 0; i < bookBox.length; i++) {
      bookInfoModelList.add(BookInfoModel.fromHiveObject(bookBox.getAt(i) as BookHiveObject));
    }
    return bookInfoModelList;
  }
}