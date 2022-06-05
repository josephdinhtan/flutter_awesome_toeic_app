import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/base_api_dao/baseAPIDAO.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/book_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/test_dao.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_manager.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';

import '../../data_providers/apis/store_api/network_store_item_object.dart';
import '../../data_providers/apis/store_api/store_api.dart';
import '../../download_manager/book_download_manager_impl.dart';

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final BaseAPIDAO _bookDAO = BookDAO();
  final BaseAPIDAO _testDAO = TestDAO();

  StoreRepositoryImpl();

  @override
  Future<List<NetworkStoreItemModel>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(NetworkStoreItemModel networkBookInfoModel) async {
    // save bookData to database book list
    log("StoreRepositoryImpl saveABookToDb() bookId: ${networkBookInfoModel.getBoxId()}");
    bool res = await _bookDAO.addItem(
        networkBookInfoModel.toHiveObject(), networkBookInfoModel.getBoxId());
    if (!res) return Future.value(false);

    // save List Test
    for (int i = 0;
        i < networkBookInfoModel.networkTestInfoModelList.length;
        i++) {
      final networkTestInfoModel =
          networkBookInfoModel.networkTestInfoModelList[i];
      final hiveId = networkBookInfoModel.childIds[i];
      res = await _testDAO.addItem(networkTestInfoModel.toHiveObject(), hiveId);
      if (!res) return Future.value(false);
    }
    return Future.value(true);
  }
}
