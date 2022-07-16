import 'package:get_it/get_it.dart';

import '../../data/business_models/test_model.dart';
import '../../data/repositories/test_repository/test_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetTestListUseCase implements BaseUseCase<List<TestModel>, List<String>> {
  final repository = GetIt.I.get<TestRepository>();

  @override
  Future<List<TestModel>> perform(hiveIds) async {
    return await repository.getTestList(hiveIds);
  }
}
