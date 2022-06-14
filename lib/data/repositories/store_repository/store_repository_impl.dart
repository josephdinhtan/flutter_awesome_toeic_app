import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/book_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/part_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/part_execute_daos/part_one_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/test_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/book_dto.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/part_dto.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/part_dto/part_one_dto.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/test_dto.dart';
import 'package:flutter_toeic_quiz2/data/repositories/store_repository/store_repository.dart';

import '../../data_providers/apis/store_api.dart';

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final BaseDao _bookDAO = BookDao();
  final BaseDao _testDAO = TestDao();
  final BaseDao _partDAO = PartDao();
  final BaseDao _partOneDAO = PartOneDao();

  StoreRepositoryImpl();

  @override
  Future<List<BookDto>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(BookDto networkBookInfoModel) async {
    //save bookData to database book list
    bool res = await _bookDAO.addItem(
        networkBookInfoModel.toHiveObject(), networkBookInfoModel.id);
    if (!res) return Future.value(false);
    return await _saveTestsToDb(networkBookInfoModel.tests_url);
  }

  Future<bool> _saveTestsToDb(String tests_url) async {
    List<TestDto> testDtoList = await _storeApi.getTestListNetwork(tests_url);
    for (final testNetworkObject in testDtoList) {
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
    List<PartDto> partDtoList = await _storeApi.getPartListNetwork(parts_url);
    for (final partNetworkObject in partDtoList) {
      bool isOk = await _partDAO.addItem(
          partNetworkObject.toBusinessModel().toHiveObject(),
          partNetworkObject.id);
      if (!isOk) return Future.value(false);
      if (!await _savePartOneQuestionToDb(partNetworkObject.questions_url)) ;
    }
    return Future.value(true);
  }

  Future<bool> _savePartOneQuestionToDb(String part_one_question_url) async {
    List<PartOneDto> partOneQuestionNetworkObjectList =
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
