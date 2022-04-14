import '../../dataproviders/base_api.dart';
import '../../models/book_info_model.dart';
import 'book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  BaseApi api;

  BookRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<BookInfoModel>> getBookList() async {
    return await api.get();
  }
}
