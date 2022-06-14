import 'dart:async';

import '../../business_models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBookList();
}
