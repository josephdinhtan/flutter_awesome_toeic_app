import 'package:get_it/get_it.dart';

import '../../data_providers/daos/book_dao.dart';

import '../../business_models/book_model.dart';
import 'book_repository.dart';

class BookWebRepositoryImpl implements BookRepository {
  final _dao = GetIt.I.get<BookDao>();

  @override
  Future<List<BookModel>> getBookList() async {
    return await _dao.queryAll([]);
  }
}
