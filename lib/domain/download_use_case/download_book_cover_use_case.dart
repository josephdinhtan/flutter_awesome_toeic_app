import 'package:flutter_toeic_quiz2/data/business_models/book_model.dart';

import '../../core_utils/core_utils.dart';

import '../../data/download_manager/book_download_manager_impl.dart';
import '../../data/download_manager/download_manager.dart';
import '../base_use_case/BaseUseCase.dart';

class DownloadBookCoverUseCase implements BaseUseCase<bool, String> {
  static final DownloadBookCoverUseCase _singleton =
      DownloadBookCoverUseCase._internal();
  DownloadBookCoverUseCase._internal();
  factory DownloadBookCoverUseCase() => _singleton;

  final DownloadManager _bookDownloadManager = BookDownloadManagerImpl();

  @override
  Future<bool> perform(bookRelativeCoverUrl) async {
    final appDocDir = getApplicationDirectory();
    final filePath = appDocDir + '/' + bookRelativeCoverUrl;
    return await _bookDownloadManager.downloadFile(
        bookRelativeCoverUrl, filePath);
  }
}
