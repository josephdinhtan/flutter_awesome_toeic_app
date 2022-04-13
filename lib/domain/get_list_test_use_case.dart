import '../data/models/test_info_model.dart';
import '../data/repositories/base_repository.dart';
import 'base_use_case.dart';

class GetListTestUseCase extends BaseUseCase<List<TestInfoModel>> {
  BaseRepository repository;

  GetListTestUseCase({
    required this.repository,
  });

  @override
  Future<List<TestInfoModel>> perform() async {
    return await repository.get();
  }
}
