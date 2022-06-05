import 'package:flutter_toeic_quiz2/data/repositories/test_repository/test_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/test_repository/test_repository_impl.dart';

class UpdateTestIsDownloadedToDB {

  TestRepository repository = TestRepositoryImpl();
  Future<bool> updateATestDataIsDownloaded(String testHiveId) async {
    return await repository.updateATestDataDownloadedToDB(testHiveId);
  }
}