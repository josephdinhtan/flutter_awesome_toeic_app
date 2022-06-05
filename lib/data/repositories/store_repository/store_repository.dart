
import 'dart:async';
import '../../data_providers/apis/store_api/network_store_item_object.dart';

abstract class StoreRepository {

  Future<List<NetworkStoreItemModel>> getBookList();
  Future<bool> saveABookToDb(NetworkStoreItemModel networkBookInfoModel);
}