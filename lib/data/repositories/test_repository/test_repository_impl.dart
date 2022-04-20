import 'package:flutter_toeic_quiz2/data/models/test_info_model.dart';

import '../../data_providers/base_api.dart';
import 'test_repository.dart';

class TestRepositoryImpl implements TestRepository {
  BaseApi api;
  TestRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<TestInfoModel>> getTestList() async {
    // check here if it web flatform or doesn't have local database
    return await api.getList();
  }
}
