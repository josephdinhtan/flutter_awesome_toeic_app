import 'package:get_it/get_it.dart';

import '../../business_models/book_model.dart';
import '../../data_providers/daos/book_dao.dart';
import '../../di/cubit_injection.dart';
import 'book_repository.dart';

class BookMobileRepositoryImpl implements BookRepository {
  final _dao = GetIt.I.get<BookDao>();

  @override
  Future<List<BookModel>> getBookList() async {
    return await _dao.queryAll([]);
  }
}
