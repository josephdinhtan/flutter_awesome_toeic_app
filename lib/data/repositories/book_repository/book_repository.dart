import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';

abstract class BookRepository {

  Future<List<BookInfoModel>> getBookList();
}