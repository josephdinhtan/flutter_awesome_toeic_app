import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';

import 'network_test_info_model.dart';

class NetworkBookInfoModel {
  int id;
  String title;
  String des;
  String author;
  String coverUrl;
  int price;
  List<NetworkTestInfoModel> networkTestInfoModelList;

  NetworkBookInfoModel({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.networkTestInfoModelList,
  });

  factory NetworkBookInfoModel.fromJson(dynamic jsonMap) {
    return NetworkBookInfoModel(
      id: jsonMap['id'] as int,
      title: jsonMap['title'] as String,
      des: jsonMap['des'] as String,
      author: jsonMap['author'] as String,
      coverUrl: jsonMap['cover_url'] as String,
      price: jsonMap['price'] as int,
      networkTestInfoModelList:
          getNetworkTestInfoModelList(jsonMap['test_detail']),
    );
  }

  BookInfoModel toBookInfoModel() {
    return BookInfoModel(
      title: title,
      price: price,
      id: id,
      des: des,
      coverUrl: coverUrl,
      author: author,
    );
  }

  static List<NetworkTestInfoModel> getNetworkTestInfoModelList(
      List<dynamic> jsonMapList) {
    List<NetworkTestInfoModel> networkTestInfoModelList = [];
    for (var jsonMap in jsonMapList) {
      networkTestInfoModelList.add(NetworkTestInfoModel.fromJson(jsonMap));
    }
    return networkTestInfoModelList;
  }
}
