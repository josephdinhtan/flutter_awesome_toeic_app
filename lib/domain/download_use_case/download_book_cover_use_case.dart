import '../../core_utils/core_utils.dart';
import '../../data/download_manager/book_download_manager_impl.dart';
import '../../data/download_manager/download_manager.dart';
import '../base_use_case/BaseUseCase.dart';

class DownloadBookCoverUseCase implements BaseUseCase<bool, String> {
  final DownloadManager _bookDownloadManager = BookDownloadManagerImpl();

  @override
  Future<bool> perform(relativeCoverUrl) async {
    final appDocDir = getApplicationDirectory();
    final filePath = appDocDir + '/' + relativeCoverUrl;
    return await _bookDownloadManager.downloadFile(relativeCoverUrl, filePath);
  }
}
