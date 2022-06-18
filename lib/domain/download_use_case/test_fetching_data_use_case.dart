import '../base_use_case/BaseUseCase.dart';

import '../../data/download_manager/test_download_manager_impl.dart';

class TestFetchingDataUseCase implements BaseUseCase<List<String>, String> {
  final TestDownloadManagerImpl _downloadManager = TestDownloadManagerImpl();

  @override
  Future<List<String>> perform(relativeUrl) async {
    return await _downloadManager.fetchingUrls(relativeUrl);
  }
}
