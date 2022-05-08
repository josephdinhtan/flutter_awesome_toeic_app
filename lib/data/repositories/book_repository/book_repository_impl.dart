import '../../data_providers/base_api.dart';
import '../../data_providers/fire_base_api/firebase_books_api.dart';
import '../../models/book_info_model.dart';
import 'book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  BaseApi api;

  BookRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<BookInfoModel>> getBookList() async {
    if(api is FirebaseBookApi) {
      return await api.getList();
    }
    return await api.getList();
  }
}
