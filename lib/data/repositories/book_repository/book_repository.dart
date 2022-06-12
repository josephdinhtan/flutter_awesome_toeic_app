import 'dart:async';

import '../../business_models/book_info_model.dart';

abstract class BookRepository {
  Future<List<BookInfoModel>> getBookList();
}
