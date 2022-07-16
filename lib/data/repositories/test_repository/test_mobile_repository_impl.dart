import 'package:get_it/get_it.dart';

import '../../business_models/test_model.dart';
import '../../data_providers/daos/test_dao.dart';
import 'test_repository.dart';

class TestMobileRepositoryImpl implements TestRepository {
  final _dao = GetIt.I.get<TestDao>();

  @override
  Future<List<TestModel>> getTestList(List<String> hiveIds) async {
    return await _dao.queryAll(hiveIds);
  }

  @override
  Future<bool> updateATestDataDownloadedToDB(String testHiveId) async {
    TestModel? testModel = await _dao.query(testHiveId);
    testModel!.isResourceDownloaded = true;
    return await _dao.insert(testModel.toHiveObject(), testHiveId);
  }

  @override
  Future<bool> updateActualScoreToDB(String testHiveId, int actualScore) async {
    final testModel = await _dao.query(testHiveId);
    if (testModel == null) return false;
    testModel.actualScore = actualScore;
    return await _dao.insert(testModel.toHiveObject(), testHiveId);
  }
}
