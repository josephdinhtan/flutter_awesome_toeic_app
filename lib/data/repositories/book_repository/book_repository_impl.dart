import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/book_dao.dart';

import '../../business_models/book_model.dart';
import 'book_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BookRepositoryImpl implements BookRepository {
  late BaseDao _dao = BookDao();

  @override
  Future<List<BookModel>> getBookList() async {
    return await _dao.getAllItems([]) as List<BookModel>;
  }
}
