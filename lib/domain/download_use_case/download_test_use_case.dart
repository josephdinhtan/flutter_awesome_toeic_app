import 'dart:developer';
import 'dart:io';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../core_utils/core_utils.dart';
import '../../data/download_manager/test_download_manager_impl.dart';

import '../../data/download_manager/download_manager.dart';

const LOG_TAG = "DownloadTestUseCase";

class DownloadTestUseCase implements BaseUseCase<bool, String> {
  static final DownloadTestUseCase _singleton = DownloadTestUseCase._internal();
  factory DownloadTestUseCase() => _singleton;
  DownloadTestUseCase._internal();

  final DownloadManager _downloadManager = TestDownloadManagerImpl();

  @override
  Future<bool> perform(relativeUrl) async {
    log('$LOG_TAG doDownload() downloadFile relativeUrl: $relativeUrl');
    final String localFilePath = getApplicationDirectory() + "/" + relativeUrl;
    if (await File(localFilePath).exists()) {
      if (LogEnable) {
        log('$LOG_TAG doDownload() downloadFile file already exits: $localFilePath');
      }
      return Future.value(true);
    }
    return await _downloadManager.downloadFile(relativeUrl, localFilePath);
  }
}
