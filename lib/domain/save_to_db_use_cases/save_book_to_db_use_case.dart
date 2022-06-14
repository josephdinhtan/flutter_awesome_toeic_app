import 'package:flutter_toeic_quiz2/data/data_providers/dtos/book_dto.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/repositories/store_repository/store_repository.dart';
import '../../data/repositories/store_repository/store_repository_impl.dart';

class SaveBookToDbUseCase implements BaseUseCase<bool, BookDto> {
  static final SaveBookToDbUseCase _singleton = SaveBookToDbUseCase._internal();
  SaveBookToDbUseCase._internal();
  factory SaveBookToDbUseCase() => _singleton;

  StoreRepository repository = StoreRepositoryImpl();

  @override
  Future<bool> perform(networkStoreItemObject) async {
    return await repository.saveABookToDb(networkStoreItemObject);
  }
}
