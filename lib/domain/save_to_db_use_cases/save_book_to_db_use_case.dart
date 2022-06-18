import '../../data/data_providers/dtos/book_dto.dart';
import '../../data/repositories/store_repository/store_repository.dart';
import '../../data/repositories/store_repository/store_repository_impl.dart';
import '../base_use_case/BaseUseCase.dart';

class SaveBookToDbUseCase implements BaseUseCase<bool, BookDto> {
  StoreRepository repository = StoreRepositoryImpl();

  @override
  Future<bool> perform(networkStoreItemObject) async {
    return await repository.saveABookToDb(networkStoreItemObject);
  }
}
