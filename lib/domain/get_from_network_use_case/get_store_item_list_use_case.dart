import '../../data/data_providers/dtos/book_dto.dart';
import '../../data/di/injection.dart';
import '../../data/repositories/store_repository/store_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetStoreItemListUseCase implements BaseUseCase<List<BookDto>, void> {
  final _repository = getIt.get<StoreRepository>();

  @override
  Future<List<BookDto>> perform(_) async {
    return await _repository.getBookList();
  }
}
