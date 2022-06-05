import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository_impl.dart';

import '../../data/business_models/test_info_model.dart';
import '../../data/data_providers/apis/store_api/network_store_item_object.dart';

class SaveBookToDbUseCase {
  StoreRepository repository = StoreRepositoryImpl();

  Future<bool> saveANewBookToDb(NetworkStoreItemModel networkStoreItemObject) async {
    return await repository.saveABookToDb(networkStoreItemObject);
  }
}
