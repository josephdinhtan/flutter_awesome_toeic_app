import 'package:flutter_toeic_quiz2/data/repositories/book_repository/book_repository.dart';
import '../../data/business_models/book_info_model.dart';
import '../../data/repositories/book_repository/book_repository_impl.dart';

class GetListBookUseCase {
  BookRepository repository = BookRepositoryImpl();

  GetListBookUseCase();

  Future<List<BookInfoModel>> getListInfo() async {
    return Future.value(repository.getBookList());
  }
}
