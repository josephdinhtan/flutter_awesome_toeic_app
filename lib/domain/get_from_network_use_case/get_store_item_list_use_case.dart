import 'package:flutter_toeic_quiz2/data/business_models/test_info_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/book_network_object.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/book_info_model.dart';

class GetStoreItemListUseCase
    implements BaseUseCase<List<BookNetworkObject>, void> {
  static final GetStoreItemListUseCase _singleton =
      GetStoreItemListUseCase._internal();
  GetStoreItemListUseCase._internal();
  factory GetStoreItemListUseCase() => _singleton;

  StoreRepository repository = StoreRepositoryImpl();

  @override
  Future<List<BookNetworkObject>> perform(_) async {
    return await repository.getBookList();
  }
}
