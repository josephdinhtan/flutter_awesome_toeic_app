import '../../data/business_models/test_model.dart';
import '../../data/repositories/test_repository/test_repository.dart';

class GetListTestUseCase {
  TestRepository repository;

  GetListTestUseCase({
    required this.repository,
  });

  Future<List<TestModel>> getListInfo(List<String> hiveIds) async {
    return await repository.getTestList(hiveIds);
  }
}
