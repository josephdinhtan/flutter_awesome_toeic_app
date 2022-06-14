import 'dart:developer';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:hive/hive.dart';

import '../../business_models/book_model.dart';
import '../hive_objects/book_hive_object/book_hive_object.dart';
import 'base_dao/base_dao.dart';
import 'box_name.dart';

const _logTag = "BookDAO";

class BookDao implements BaseDao<BookModel, BookHiveObject> {
  static final BookDao _singleton = BookDao._internal();
  BookDao._internal();
  factory BookDao() => _singleton;

  @override
  Future<bool> addItem(HiveObject item, String hiveId) async {
    try {
      if (LogEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
      if (LogEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (LogEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    if (LogEnable) {
      log("$_logTag addItem() bookBox.length: ${bookBox.length}");
    }
    await bookBox.put(hiveId, item);
    if (LogEnable) log("$_logTag addItem() bookBox put done");
    return true;
  }

  @override
  Future<BookModel?> getItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      log("$_logTag getItem() ${e.toString()}");
      return null;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    final hiveObject =
        await bookBox.get(hiveId, defaultValue: null) as BookHiveObject;
    return BookModel.fromHiveObject(hiveObject);
  }

  @override
  Future<bool> removeItem(String hiveId) async {
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
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
  Future<List<BookModel>> getAllItems(List<String> hiveIds) async {
    List<BookModel> bookInfoModelList = [];
    try {
      await Hive.openBox(BoxName.BOOK_BOX_NAME);
    } catch (e) {
      return bookInfoModelList;
    }
    final bookBox = Hive.box(BoxName.BOOK_BOX_NAME);
    for (int i = 0; i < bookBox.length; i++) {
      bookInfoModelList
          .add(BookModel.fromHiveObject(bookBox.getAt(i) as BookHiveObject));
    }
    return bookInfoModelList;
  }
}
