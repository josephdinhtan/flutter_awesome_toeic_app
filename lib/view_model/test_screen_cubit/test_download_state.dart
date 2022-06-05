part of 'test_download_cubit.dart';

abstract class TestDownloadState {}

class TestNotDownload extends TestDownloadState {}
class TestFetchingDownload extends TestDownloadState {}
class TestDownloading extends TestDownloadState {
  double progress;
  TestDownloading({required this.progress});
}
class TestDownloaded extends TestDownloadState {}
