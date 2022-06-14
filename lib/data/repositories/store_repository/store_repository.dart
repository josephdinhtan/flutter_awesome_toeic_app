import 'dart:async';

import '../../data_providers/dtos/book_dto.dart';

abstract class StoreRepository {
  Future<List<BookDto>> getBookList();
  Future<bool> saveABookToDb(BookDto networkBookInfoModel);
}
