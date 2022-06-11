import 'dart:developer';
import 'dart:io';

import '../../utils/misc.dart';

import '../../data/download_manager/test_download_manager_impl.dart';

import '../../data/download_manager/download_manager.dart';

const LOG_TAG = "DownloadTestUseCase";

class DownloadTestUseCase {
  final DownloadManager _downloadManager = TestDownloadManagerImpl();

  Future<bool> doDownload(relativeUrl) async {
    final String localFilePath = getApplicationDirectory() + relativeUrl;
    final file = File(localFilePath);
    if (await File(localFilePath).exists()) {
      log('$LOG_TAG doDownload() downloadFile file already exits: $localFilePath');
      return Future.value(true);
    }
    return await _downloadManager.downloadFile(relativeUrl, localFilePath);
  }
}
