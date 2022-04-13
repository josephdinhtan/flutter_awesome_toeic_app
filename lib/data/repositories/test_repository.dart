import 'package:flutter_toeic_quiz2/data/models/test_info_model.dart';

import '../dataproviders/base_api.dart';
import 'base_repository.dart';

class TestRepository extends BaseRepository<List<TestInfoModel>> {
  BaseApi api;
  TestRepository({
    required this.api,
  });

  @override
  Future<List<TestInfoModel>> get() async {
    return await api.get();
  }
}
