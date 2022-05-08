import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/book_info_model.dart';
import '../base_api.dart';
import '../network_response_models/network_book_info_model.dart';

class FirebaseBookApi extends BaseApi<List<BookInfoModel>> {
  static final List<NetworkBookInfoModel> _networkBookInfoModelList = [];// 1 instance

  @override
  Future<List<BookInfoModel>> getList() async {
    if(_networkBookInfoModelList.isEmpty) {
      await updateNetworkBookInfoModelList();
    }
    List<BookInfoModel> bookInfoModelList = [];
    for(var networkBookInfoModel in _networkBookInfoModelList) {
      bookInfoModelList.add(networkBookInfoModel.toBookInfoModel());
      //print('tandq print bookInfoModelList: ${networkBookInfoModel.toBookInfoModel().toString()}');
    }
    print('tandq print download url1: ${bookInfoModelList[0].coverUrl}');
    //tring url = await getDownloadUrlStr(bookInfoModelList[0].coverUrl);
    //print('tandq print download url: ${url}');
    return bookInfoModelList;
  }

  Future<String> getDownloadUrlStr(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  Future<void> updateNetworkBookInfoModelList() async {
    _networkBookInfoModelList.clear();
    final String jsonString = await _getRawMainFileItemList();
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for(var jsonMap in jsonMapList) {
      final networkBookInfoModel = NetworkBookInfoModel.fromJson(jsonMap);
      networkBookInfoModel.coverUrl = await getDownloadUrlStr(networkBookInfoModel.coverUrl);
      _networkBookInfoModelList.add(networkBookInfoModel);
    }
  }

  static Future<String> _getRawMainFileItemList() async {
    const path = "/resource_files/toeic_books/items_summary.json";
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    //print('tandq res: $res');
    return res;
  }
}