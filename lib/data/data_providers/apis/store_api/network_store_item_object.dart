import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';
import 'package:hive/hive.dart';

import '../../../business_models/book_info_model.dart';
import '../../../data_source/hive_objects/book_hive_object/book_hive_object.dart';
import '../../network_response_models/network_test_object.dart';

class NetworkStoreItemModel implements NetworkBaseObject<BookInfoModel> {
  String id;
  String title;
  String des;
  String author;
  String coverUrl;
  String networkUrl;
  int price;
  bool isBought;
  List<String> childIds;
  List<NetworkTestObject> networkTestInfoModelList;

  NetworkStoreItemModel({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    this.networkUrl = "",
    required this.price,
    this.isBought = false,
    required this.childIds,
    required this.networkTestInfoModelList,
  });

  factory NetworkStoreItemModel.fromJson(dynamic jsonMap) {
    return NetworkStoreItemModel(
      id: jsonMap['id'] as String,
      title: jsonMap['title'] as String,
      des: jsonMap['des'] as String,
      author: jsonMap['author'] as String,
      coverUrl: jsonMap['cover_url'] as String,
      price: jsonMap['price'] as int,
      networkTestInfoModelList:
          _getNetworkTestInfoModelList(jsonMap['test_detail']),
      childIds: _getChilds(jsonMap),
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
      networkUrl: networkUrl,
      childIds: childIds,
    );
  }

  static List<String> _getChilds(dynamic jsonMap) {
    List<String> res = [];
    List<dynamic> jsonMapList = jsonMap['test_detail'];
    String baseId = jsonMap['id'] as String;
    for (int i = 0; i < jsonMapList.length; i++) {
      res.add("${baseId}_$i");
    }
    return res;
  }

  static List<NetworkTestObject> _getNetworkTestInfoModelList(
      List<dynamic> jsonMapList) {
    List<NetworkTestObject> networkTestInfoModelList = [];
    for (var jsonMap in jsonMapList) {
      networkTestInfoModelList.add(NetworkTestObject.fromJson(jsonMap));
    }
    return networkTestInfoModelList;
  }

  String getBoxId() {
    final boxId = "${title.replaceAll(" ", "_")}_$id";
    return boxId;
  }

  HiveObject toHiveObject() {
    return BookHiveObject(
      id: id,
      title: title,
      des: des,
      author: author,
      coverLocalUrl: coverUrl,
      childId: childIds,
    );
  }
}
