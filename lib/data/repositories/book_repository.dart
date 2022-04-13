import 'package:flutter_toeic_quiz2/data/dataproviders/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/base_repository.dart';

class BookRepository extends BaseRepository<List<BookInfoModel>> {
  BaseApi api;
  BookRepository({
    required this.api,
  });

  @override
  Future<List<BookInfoModel>> get() async {
    return await api.get();
  }
}
