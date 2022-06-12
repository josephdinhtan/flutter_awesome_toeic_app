import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/base_api_dao/baseAPIDAO.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_part_object/part_one_question_network_object.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/part_network_object.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/test_network_object.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/book_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/part_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/part_execute_daos/part_one_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/test_dao.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_manager.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';

import '../../data_providers/apis/store_api.dart';
import '../../data_providers/network_response_models/book_network_object.dart';
import '../../download_manager/book_download_manager_impl.dart';

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final BaseAPIDAO _bookDAO = BookDAO();
  final BaseAPIDAO _testDAO = TestDAO();
  final BaseAPIDAO _partDAO = PartDAO();
  final BaseAPIDAO _partOneDAO = PartOneDAO();

  StoreRepositoryImpl();

  @override
  Future<List<BookNetworkObject>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(BookNetworkObject networkBookInfoModel) async {
    //save bookData to database book list
    bool res = await _bookDAO.addItem(
        networkBookInfoModel.toHiveObject(), networkBookInfoModel.id);
    if (!res) return Future.value(false);
    return await _saveTestsToDb(networkBookInfoModel.tests_url);
  }

  Future<bool> _saveTestsToDb(String tests_url) async {
    List<TestNetworkObject> testNetworkObjectList =
        await _storeApi.getTestListNetwork(tests_url);
    for (final testNetworkObject in testNetworkObjectList) {
      bool isOk = await _testDAO.addItem(
          testNetworkObject.toBusinessModel().toHiveObject(),
          testNetworkObject.id);
      if (!isOk) return Future.value(false);
      if (!await _savePartsToDb(testNetworkObject.parts_url)) {
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  Future<bool> _savePartsToDb(String parts_url) async {
    List<PartNetworkObject> partNetworkObjectList =
        await _storeApi.getPartListNetwork(parts_url);
    for (final partNetworkObject in partNetworkObjectList) {
      bool isOk = await _partDAO.addItem(
          partNetworkObject.toBusinessModel().toHiveObject(),
          partNetworkObject.id);
      if (!isOk) return Future.value(false);
      if (!await _savePartOneQuestionToDb(partNetworkObject.questions_url)) ;
    }
    return Future.value(true);
  }

  Future<bool> _savePartOneQuestionToDb(String part_one_question_url) async {
    List<PartOneQuestionNetworkObject> partOneQuestionNetworkObjectList =
        await _storeApi.getPartOneListNetwork(part_one_question_url);
    for (final partOneQuestionNetworkObject
        in partOneQuestionNetworkObjectList) {
      bool isOk = await _partOneDAO.addItem(
          partOneQuestionNetworkObject.toBusinessModel().toHiveObject(),
          partOneQuestionNetworkObject.id);
      if (!isOk) return Future.value(false);
    }
    return Future.value(true);
  }
}
