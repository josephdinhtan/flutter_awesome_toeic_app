
import '../../data/business_models/test_info_model.dart';
import '../../data/repositories/test_repository/test_repository.dart';

class GetListTestUseCase {
  TestRepository repository;

  GetListTestUseCase({
    required this.repository,
  });

  Future<List<TestInfoModel>> getListInfo() async {
    return await repository.getTestList();
  }
}
