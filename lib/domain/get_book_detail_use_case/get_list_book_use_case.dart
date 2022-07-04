import 'package:get_it/get_it.dart';

import '../../data/business_models/book_model.dart';
import '../../data/repositories/book_repository/book_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetListBookUseCase implements BaseUseCase<List<BookModel>, void> {
  final repository = GetIt.I.get<BookRepository>();

  @override
  Future<List<BookModel>> perform([_]) async {
    return Future.value(repository.getBookList());
  }
}
