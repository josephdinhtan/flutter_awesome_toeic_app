import '../../data_providers/apis/test_api.dart';
import '../../di/injection.dart';

import '../../business_models/test_model.dart';
import 'test_repository.dart';

class TestWebRepositoryImpl implements TestRepository {
  final _api = getIt.get<TestApi>();

  @override
  Future<List<TestModel>> getTestList(List<String> hiveIds) async {
    return await _api.queryAll(hiveIds);
  }

  @override
  Future<bool> updateATestDataDownloadedToDB(String testHiveId) async {
    // nothing to do in web
    return true;
  }
}
