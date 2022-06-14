import 'package:flutter_toeic_quiz2/data/data_providers/dtos/book_dto.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/book_model.dart';

class GetStoreItemListUseCase implements BaseUseCase<List<BookDto>, void> {
  static final GetStoreItemListUseCase _singleton =
      GetStoreItemListUseCase._internal();
  GetStoreItemListUseCase._internal();
  factory GetStoreItemListUseCase() => _singleton;

  StoreRepository repository = StoreRepositoryImpl();

  @override
  Future<List<BookDto>> perform(_) async {
    return await repository.getBookList();
  }
}
