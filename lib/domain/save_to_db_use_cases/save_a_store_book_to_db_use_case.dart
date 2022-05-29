import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository_impl.dart';

class SaveAStoreBookToDbUseCase {
  StoreRepository repository = StoreRepositoryImpl();

  Future<bool> saveANewBookToDb(BookInfoModel bookInfoModel) async {
    return await repository.saveABookToDb(bookInfoModel);
  }
}
