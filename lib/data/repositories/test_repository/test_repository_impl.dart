import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/test_dao.dart';

import '../../business_models/test_model.dart';
import 'test_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TestRepositoryImpl implements TestRepository {
  BaseDao _dao = TestDao();

  @override
  Future<List<TestModel>> getTestList(List<String> hiveIds) async {
    return await _dao.getAllItems(hiveIds) as List<TestModel>;
  }

  @override
  Future<bool> updateATestDataDownloadedToDB(String testHiveId) async {
    // TestsInfoModel testInfoModel
    //      await _apidao.getItem(testHiveId) as TestsInfoModel;
    // testInfoModel.isResourceDownloaded = true;
    // return await _apidao.addItem(testInfoModel.toHiveObject(), testHiveId);
    return true;
  }
}
