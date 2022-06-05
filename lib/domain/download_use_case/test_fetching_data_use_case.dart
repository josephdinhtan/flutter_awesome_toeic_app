import '../../data/download_manager/download_manager.dart';
import '../../data/download_manager/test_download_manager_impl.dart';

class TestFetchingDataUseCase {
  final TestDownloadManagerImpl _downloadManager = TestDownloadManagerImpl();

  Future<List<String>> doFetching(relativeUrl) async {
    return await _downloadManager.fetchingUrls(relativeUrl);
  }
}