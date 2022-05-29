import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository_impl.dart';

import '../../data/business_models/book_info_model.dart';

class GetStoreItemListUseCase {
  StoreRepository repository = StoreRepositoryImpl();

  Future<List<BookInfoModel>> getListInfo() async {
    return Future.value(repository.getBookList());
  }
}
