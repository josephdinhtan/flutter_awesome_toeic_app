import '../../business_models/test_model.dart';

abstract class TestRepository {
  Future<List<TestModel>> getTestList(List<String> hiveIds);
  Future<bool> updateATestDataDownloadedToDB(String testHiveId);
  Future<bool> updateActualScoreToDB(String testHiveId, int actualScore);
}
