import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/domain/download_use_case/download_test_use_case.dart';

import '../../../../../domain/download_use_case/test_fetching_data_use_case.dart';
import '../../../../../domain/save_to_db_use_cases/update_test_isdownloaded_to_db.dart';
import 'download_status.dart';
import 'download_controller.dart';

const LOG_TAG = "DataBaseDownloadController";

class DataBaseDownloadController extends DownloadController
    with ChangeNotifier {
  DataBaseDownloadController(
      {DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
      double progress = 0.0,
      required this.resourceUrl,
      required this.testHiveId,
      required VoidCallback onOpenDownload,
      test})
      : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  String testHiveId;
  String resourceUrl;
  DownloadStatus _downloadStatus;

  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  double _progress;

  @override
  double get progress => _progress;

  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  @override
  void startDownload() {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doDataBaseDownload();
    }
  }

  Future<void> _doDataBaseDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();
    log('$LOG_TAG resourceUrl: $resourceUrl');
    List<String> itemAudioUrls =
        await TestFetchingDataUseCase().doFetching("$resourceUrl/audios");
    List<String> itemPictureUrls =
        await TestFetchingDataUseCase().doFetching("$resourceUrl/pictures");

    log('$LOG_TAG itemAudioUrl: $itemAudioUrls');
    log('$LOG_TAG itemPictureUrl: $itemPictureUrls');
    if (!_isDownloading) {
      return;
    }
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();
    double count = 0,
        allFileCount =
            itemAudioUrls.length.toDouble() + itemPictureUrls.length.toDouble();

    DownloadTestUseCase downloadTestUseCase = DownloadTestUseCase();
    for (final itemAudioUrl in itemAudioUrls) {
      await downloadTestUseCase.doDownload(itemAudioUrl);
      _progress = count / allFileCount;
      count++;
      notifyListeners();
      if (!_isDownloading) {
        return;
      }
    }
    for (final itemPictureUrl in itemPictureUrls) {
      await downloadTestUseCase.doDownload(itemPictureUrl);
      _progress = count / allFileCount;
      count++;
      notifyListeners();
      if (!_isDownloading) {
        return;
      }
    }

    UpdateTestIsDownloadedToDB updateDB = UpdateTestIsDownloadedToDB();
    await updateDB.updateATestDataIsDownloaded(testHiveId);
    // save text data for each part here
    // ............
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }
}
