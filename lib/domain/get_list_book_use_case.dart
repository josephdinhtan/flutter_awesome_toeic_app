import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/book_repository/book_repository.dart';
import 'base_use_case.dart';

class GetListBookUseCase implements BaseUseCase<List<BookInfoModel>> {
  BookRepository repository;

  GetListBookUseCase({
    required this.repository,
  });

  @override
  Future<List<BookInfoModel>> getListInfo() async {
    return Future.value(repository.getBookList());
  }
}
