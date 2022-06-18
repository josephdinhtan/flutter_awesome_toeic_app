import '../../data/business_models/test_model.dart';
import '../../data/di/injection.dart';
import '../../data/repositories/test_repository/test_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetListTestUseCase implements BaseUseCase<List<TestModel>, List<String>> {
  final repository = getIt.get<TestRepository>();

  @override
  Future<List<TestModel>> perform(hiveIds) async {
    return await repository.getTestList(hiveIds);
  }
}
