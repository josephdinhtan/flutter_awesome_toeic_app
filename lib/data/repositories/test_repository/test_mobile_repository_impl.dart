import '../../business_models/test_model.dart';
import '../../data_providers/daos/test_dao.dart';
import '../../di/injection.dart';
import 'test_repository.dart';

class TestMobileRepositoryImpl implements TestRepository {
  final _dao = getIt.get<TestDao>();

  @override
  Future<List<TestModel>> getTestList(List<String> hiveIds) async {
    return await _dao.queryAll(hiveIds) as List<TestModel>;
  }

  @override
  Future<bool> updateATestDataDownloadedToDB(String testHiveId) async {
    // TestsInfoModel testInfoModel
    //      await _apidao.getItem(testHiveId) as TestsInfoModel;
    // testInfoModel.isResourceDownloaded = true;
    // return await _apidao.addItem(testInfoModel.toHiveObject(), testHiveId);
    return true;
  }
}
