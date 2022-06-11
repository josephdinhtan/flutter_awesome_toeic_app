import '../../data/repositories/test_repository/test_repository.dart';
import '../../data/repositories/test_repository/test_repository_impl.dart';

class UpdateTestIsDownloadedToDB {
  static final _singleton = UpdateTestIsDownloadedToDB._internal();
  UpdateTestIsDownloadedToDB._internal();
  factory UpdateTestIsDownloadedToDB() {
    return _singleton;
  }

  TestRepository repository = TestRepositoryImpl();
  Future<bool> updateATestDataIsDownloaded(String testHiveId) async {
    return await repository.updateATestDataDownloadedToDB(testHiveId);
  }
}
