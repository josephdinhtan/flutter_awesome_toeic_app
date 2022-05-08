import '../data/data_providers/fire_base_api/firebase_books_api.dart';
import '../data/models/book_info_model.dart';
import '../data/repositories/book_repository/book_repository.dart';
import '../data/repositories/book_repository/book_repository_impl.dart';
import 'base_use_case.dart';

class GetStoreItemListUseCase implements BaseUseCase<List<BookInfoModel>> {
  BookRepository repository = BookRepositoryImpl(api: FirebaseBookApi());

  @override
  Future<List<BookInfoModel>> getListInfo() async {
    return Future.value(repository.getBookList());
  }
}
