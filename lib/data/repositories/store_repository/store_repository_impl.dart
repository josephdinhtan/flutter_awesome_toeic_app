import 'dart:developer';

import '../../data_providers/daos/base_dao/base_dao.dart';
import '../../data_providers/daos/book_dao.dart';
import '../../data_providers/daos/part_dao.dart';
import '../../data_providers/daos/part_execute_daos/part_one_dao.dart';
import '../../data_providers/daos/test_dao.dart';
import '../../data_providers/dtos/book_dto.dart';
import '../../data_providers/dtos/part_dto.dart';
import '../../data_providers/dtos/parts_dto/part_one_dto.dart';
import '../../data_providers/dtos/parts_dto/part_two_dto.dart';
import '../../data_providers/dtos/test_dto.dart';
import 'store_repository.dart';

import '../../data_providers/apis/store_api.dart';
import '../../data_providers/daos/part_execute_daos/part_three_dao.dart';
import '../../data_providers/daos/part_execute_daos/part_two_dao.dart';
import '../../data_providers/dtos/parts_dto/part_three_dto.dart';

const _logTag = "StoreRepositoryImpl";

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final BaseDao _bookDao = BookDao();
  final BaseDao _testDao = TestDao();
  final BaseDao _partDao = PartDao();
  final BaseDao _partOneDao = PartOneDao();
  final BaseDao _partTwoDao = PartTwoDao();
  final BaseDao _partThreeDao = PartThreeDao();

  StoreRepositoryImpl();

  @override
  Future<List<BookDto>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(BookDto networkBookInfoModel) async {
    //save bookData to database book list
    bool res = await _bookDao.addItem(
        networkBookInfoModel.toHiveObject(), networkBookInfoModel.id);
    if (!res) return Future.value(false);
    return await _saveTestsToDb(networkBookInfoModel.tests_url);
  }

  Future<bool> _saveTestsToDb(String tests_url) async {
    List<TestDto> testDtoList = await _storeApi.getTestListNetwork(tests_url);
    for (final testNetworkObject in testDtoList) {
      bool isOk = await _testDao.addItem(
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
    int i = 1;
    for (final partDto in partDtoList) {
      bool isOk = await _partDao.addItem(
          partDto.toBusinessModel().toHiveObject(), partDto.id);
      if (!isOk) return Future.value(false);
      switch (i) {
        case 1:
          if (!await _savePartOneQuestionToDb(partDto.questions_url)) {
            return Future.value(false);
          }
          break;
        case 2:
          if (!await _savePartTwoQuestionToDb(partDto.questions_url)) {
            return Future.value(false);
          }
          break;
        case 3:
          if (!await _savePartThreeQuestionToDb(partDto.questions_url)) {
            return Future.value(false);
          }
          break;
      }
      i++;
    }
    return Future.value(true);
  }

  Future<bool> _savePartOneQuestionToDb(String partOneQuestionUrl) async {
    List<PartOneDto> partOneDtoList =
        await _storeApi.getPartOneListNetwork(partOneQuestionUrl);
    for (final partOneDto in partOneDtoList) {
      bool isOk = await _partOneDao.addItem(
          partOneDto.toBusinessModel().toHiveObject(), partOneDto.id);
      if (!isOk) return Future.value(false);
    }
    return Future.value(true);
  }

  Future<bool> _savePartTwoQuestionToDb(String partTwoQuestionUrl) async {
    List<PartTwoDto> partTwoDtoList =
        await _storeApi.getPartTwoListNetwork(partTwoQuestionUrl);
    for (final partTwoDto in partTwoDtoList) {
      bool isOk = await _partTwoDao.addItem(
          partTwoDto.toBusinessModel().toHiveObject(), partTwoDto.id);
      if (!isOk) return Future.value(false);
    }
    return Future.value(true);
  }

  Future<bool> _savePartThreeQuestionToDb(String partThreeQuestionUrl) async {
    List<PartThreeDto> partThreeDtoList =
        await _storeApi.getPartThreeListNetwork(partThreeQuestionUrl);
    for (final partThreeDto in partThreeDtoList) {
      bool isOk = await _partThreeDao.addItem(
          partThreeDto.toBusinessModel().toHiveObject(), partThreeDto.id);
      if (!isOk) return Future.value(false);
    }
    return Future.value(true);
  }
}
