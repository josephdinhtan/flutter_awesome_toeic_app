import '../../data/repositories/test_repository/test_mobile_repository_impl.dart';
import '../../data/repositories/test_repository/test_repository.dart';

class UpdateTestIsDownloadedToDB {
  TestRepository repository = TestMobileRepositoryImpl();
  Future<bool> updateATestDataIsDownloaded(String testHiveId) async {
    return await repository.updateATestDataDownloadedToDB(testHiveId);
  }
}
