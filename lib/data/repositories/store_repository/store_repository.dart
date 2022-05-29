
import 'dart:async';

import '../../business_models/book_info_model.dart';

abstract class StoreRepository {

  Future<List<BookInfoModel>> getBookList();
  Future<bool> saveABookToDb(BookInfoModel bookInfoModel);
}