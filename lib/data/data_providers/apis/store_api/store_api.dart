import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz2/data/business_models/test_info_model.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_constant.dart';

import '../../../business_models/book_info_model.dart';
import '../../network_response_models/network_book_object.dart';
import 'network_store_item_object.dart';

class StoreApi {
  // one instant only
  static final List<NetworkStoreItemModel> _networkBookInfoModelList = [];

  Future<List<NetworkStoreItemModel>> getBookListNetwork() async {
    if (_networkBookInfoModelList.isEmpty) {
      await _updateNetworkBookInfoModelList();
    }
    return _networkBookInfoModelList;
  }

  Future<String> _getDownloadUrlFromPath(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  Future<void> _updateNetworkBookInfoModelList() async {
    _networkBookInfoModelList.clear();
    final String jsonString = await _getRawMainFileItemList();
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final networkBookInfoModel = NetworkStoreItemModel.fromJson(jsonMap);
      networkBookInfoModel.networkUrl =
          await _getDownloadUrlFromPath(networkBookInfoModel.coverUrl);
      _networkBookInfoModelList.add(networkBookInfoModel);
    }
  }

  static Future<String> _getRawMainFileItemList() async {
    const path = DownloadConstant.MainJsonFileBaseRelativePath;
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }
}
