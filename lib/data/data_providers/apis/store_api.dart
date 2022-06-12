import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/part_network_object.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/test_network_object.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_constant.dart';

import '../network_response_models/book_network_object.dart';
import '../network_response_models/network_part_object/part_one_question_network_object.dart';

class StoreApi {
  static final StoreApi _singleton = StoreApi._internal();
  StoreApi._internal();
  factory StoreApi() => _singleton;

  static final List<BookNetworkObject> _networkBookInfoModelList = [];

  Future<List<PartOneQuestionNetworkObject>> getPartOneListNetwork(
      String path) async {
    final List<PartOneQuestionNetworkObject> partOneNetworkObjectList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partOneNetworkObject =
          PartOneQuestionNetworkObject.fromMap(jsonMap);
      partOneNetworkObjectList.add(partOneNetworkObject);
    }
    return partOneNetworkObjectList;
  }

  Future<List<PartNetworkObject>> getPartListNetwork(String path) async {
    final List<PartNetworkObject> partNetworkObjectList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partNetworkObject = PartNetworkObject.fromMap(jsonMap);
      partNetworkObjectList.add(partNetworkObject);
    }
    return partNetworkObjectList;
  }

  Future<List<TestNetworkObject>> getTestListNetwork(String path) async {
    final List<TestNetworkObject> testNetworkObjectList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final testNetworkObject = TestNetworkObject.fromMap(jsonMap);
      testNetworkObjectList.add(testNetworkObject);
    }
    return testNetworkObjectList;
  }

  Future<List<BookNetworkObject>> getBookListNetwork() async {
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
    final String jsonString = await _getRawBooksJsonFile();
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final networkBookInfoObject = BookNetworkObject.fromMap(jsonMap);
      networkBookInfoObject.full_cover_url =
          await _getDownloadUrlFromPath(networkBookInfoObject.cover_url);
      _networkBookInfoModelList.add(networkBookInfoObject);
    }
  }

  static Future<String> _getRawBooksJsonFile() async {
    const path = DownloadConstant.BooksJsonFileBaseRelativePath;
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }

  static Future<String> _getRawJsonFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }
}
