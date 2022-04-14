import 'package:flutter_toeic_quiz2/data/repositories/test_repository/test_repository.dart';

import '../data/models/test_info_model.dart';
import 'base_use_case.dart';

class GetListTestUseCase extends BaseUseCase<List<TestInfoModel>> {
  TestRepository repository;

  GetListTestUseCase({
    required this.repository,
  });

  @override
  Future<List<TestInfoModel>> getListInfo() async {
    return await repository.getTestList();
  }
}
