import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/base_api_dao/baseAPIDAO.dart';
import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/book_dao.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_manager.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../data_providers/apis/store_api/store_api.dart';
import '../../download_manager/book_download_manager_impl.dart';

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final DownloadManager _bookDownloadManager = BookDownloadManagerImpl();
  final BaseAPIDAO _bookDAO = BookDAO();

  StoreRepositoryImpl();

  @override
  Future<List<BookInfoModel>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(BookInfoModel bookInfoModel) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = appDocDir.path + '/' + bookInfoModel.coverUrl;
    // download bookImage
    final res = await _bookDownloadManager.downloadFile(bookInfoModel.coverUrl, filePath);
    if(!res) {
      return Future.value(false);
    }
    // save bookData to database book list
    log("StoreRepositoryImpl saveABookToDb() bookId: ${bookInfoModel.getBoxId()}");
    return await _bookDAO.addItem(bookInfoModel.toHiveObject(), bookInfoModel.getBoxId());
  }
}
