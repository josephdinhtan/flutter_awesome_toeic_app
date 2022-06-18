import 'dart:developer';
import 'dart:io';

import '../../core_utils/global_configuration.dart';
import '../base_use_case/BaseUseCase.dart';

import '../../core_utils/core_utils.dart';
import '../../data/download_manager/test_download_manager_impl.dart';

import '../../data/download_manager/download_manager.dart';

const _logTag = "DownloadTestUseCase";

class DownloadTestUseCase implements BaseUseCase<bool, String> {
  final DownloadManager _downloadManager = TestDownloadManagerImpl();

  @override
  Future<bool> perform(relativeUrl) async {
    log('$_logTag doDownload() downloadFile relativeUrl: $relativeUrl');
    final String localFilePath = getApplicationDirectory() + "/" + relativeUrl;
    if (await File(localFilePath).exists()) {
      if (logEnable) {
        log('$_logTag doDownload() downloadFile file already exits: $localFilePath');
      }
      return Future.value(true);
    }
    return await _downloadManager.downloadFile(relativeUrl, localFilePath);
  }
}
