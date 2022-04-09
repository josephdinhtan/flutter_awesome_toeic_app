import 'package:flutter_toeic_quiz2/data/dataproviders/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';
import 'package:flutter_toeic_quiz2/data/repositories/base_repository.dart';

class BookRepository extends BaseRepository<List<BookInfor>> {
  BaseApi api;
  BookRepository({
    required this.api,
  });

  @override
  Future<List<BookInfor>> get() async {
    return await api.get();
  }
}
