import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../domain/download_use_case/download_test_use_case.dart';

part 'test_download_state.dart';

class TestDownloadCubit extends Cubit<TestDownloadState> {
  TestDownloadCubit() : super(TestNotDownload());
  final testDownloadUseCase = GetIt.I.get<DownloadTestUseCase>();

  Future<void> startDownload(String downloadUrl) async {
    emit(TestFetchingDownload());
    await Future.delayed(const Duration(seconds: 2));
    emit(TestDownloading(progress: 0.1));
    await Future.delayed(const Duration(seconds: 1));
    emit(TestDownloading(progress: 0.5));
    await Future.delayed(const Duration(seconds: 1));
    emit(TestDownloading(progress: 1));
    emit(TestDownloaded());
  }

  void stopDownload() {}
  void openDownload() {}
}
