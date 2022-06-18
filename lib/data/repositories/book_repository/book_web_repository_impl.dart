import '../../data_providers/daos/book_dao.dart';
import '../../di/injection.dart';

import '../../business_models/book_model.dart';
import 'book_repository.dart';

class BookWebRepositoryImpl implements BookRepository {
  final _dao = getIt.get<BookDao>();

  @override
  Future<List<BookModel>> getBookList() async {
    return await _dao.queryAll([]);
  }
}
