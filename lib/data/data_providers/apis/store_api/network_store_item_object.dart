
import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';

import '../../../business_models/book_info_model.dart';
import '../../network_response_models/network_test_object.dart';

class NetworkStoreItemObject implements NetworkBaseObject<BookInfoModel> {
  int id;
  String title;
  String des;
  String author;
  String coverUrl;
  String networkUrl;
  int price;
  List<NetworkTestObject> networkTestInfoModelList;

  NetworkStoreItemObject({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    this.networkUrl = "",
    required this.price,
    required this.networkTestInfoModelList,
  });

  factory NetworkStoreItemObject.fromJson(dynamic jsonMap) {
    return NetworkStoreItemObject(
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


  @override
  BookInfoModel toBusinessModel() {
    return BookInfoModel(
        id: id,
        title: title,
        price: price,
        des: des,
        coverUrl: coverUrl,
        author: author,
        networkUrl: networkUrl
    );
  }

  static List<NetworkTestObject> getNetworkTestInfoModelList(
      List<dynamic> jsonMapList) {
    List<NetworkTestObject> networkTestInfoModelList = [];
    for (var jsonMap in jsonMapList) {
      networkTestInfoModelList.add(NetworkTestObject.fromJson(jsonMap));
    }
    return networkTestInfoModelList;
  }
}
