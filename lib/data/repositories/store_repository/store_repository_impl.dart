import 'package:get_it/get_it.dart';

import '../../data_providers/apis/store_api.dart';
import '../../data_providers/daos/book_dao.dart';
import '../../data_providers/daos/part_dao.dart';
import '../../data_providers/daos/question_group_dao.dart';
import '../../data_providers/daos/test_dao.dart';
import '../../data_providers/dtos/book_dto.dart';
import '../../data_providers/dtos/part_dto.dart';
import '../../data_providers/dtos/question_group_dto.dart';
import '../../data_providers/dtos/test_dto.dart';
import 'store_repository.dart';

const _logTag = "StoreRepositoryImpl";

class StoreRepositoryImpl implements StoreRepository {
  // dependencies
  final StoreApi _storeApi = StoreApi();
  final _bookDao = GetIt.I.get<BookDao>();
  final _testDao = GetIt.I.get<TestDao>();
  final _partDao = GetIt.I.get<PartDao>();
  final _questionGroupDao = GetIt.I.get<QuestionGroupDao>();

  StoreRepositoryImpl();

  @override
  Future<List<BookDto>> getBookList() async {
    return await _storeApi.getBookListNetwork();
  }

  @override
  Future<bool> saveABookToDb(BookDto networkBookInfoModel) async {
    bool res = await _bookDao.insert(
        networkBookInfoModel.toHiveObject(), networkBookInfoModel.id);
    if (!res) return Future.value(false);
    return await _saveTestsToDb(networkBookInfoModel.testUrls);
  }

  Future<bool> _saveTestsToDb(String tests_url) async {
    List<TestDto> testDtoList = await _storeApi.getTestListNetwork(tests_url);
    for (final testNetworkObject in testDtoList) {
      bool isOk = await _testDao.insert(
          testNetworkObject.toBusinessModel().toHiveObject(),
          testNetworkObject.id);
      if (!isOk) return Future.value(false);
      if (!await _savePartsToDb(testNetworkObject.partsUrl)) {
        return Future.value(false);
      }
      if (!await _saveQuestionToDb(testNetworkObject.questionsUrl)) {
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  Future<bool> _savePartsToDb(String parts_url) async {
    List<PartDto> partDtoList = await _storeApi.getPartListNetwork(parts_url);
    int i = 1;
    for (final partDto in partDtoList) {
      bool isOk = await _partDao.insert(
          partDto.toBusinessModel().toHiveObject(), partDto.id);
      if (!isOk) return Future.value(false);
      i++;
    }
    return Future.value(true);
  }

  Future<bool> _saveQuestionToDb(String questionsJsonFileUrl) async {
    List<QuestionGroupDto> questionDtos =
        await _storeApi.getQuestionsNetwork(questionsJsonFileUrl);
    for (final questionDto in questionDtos) {
      bool isOk = await _questionGroupDao.insert(
          questionDto.toBusinessModel().toHiveObject(), questionDto.id);
      if (!isOk) return Future.value(false);
    }
    return Future.value(true);
  }
}
