
import 'package:flutter_toeic_quiz2/data/data_providers/apis/test_api.dart';

import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/test_info_model.dart';
import '../../data_source/daos/test_dao.dart';
import 'test_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TestRepositoryImpl implements TestRepository {
  late BaseAPIDAO _apidao;
  TestRepositoryImpl() {
    if(kIsWeb) {
      _apidao = TestApi();
    } else {
      _apidao = TestDAO();
    }
  }

  @override
  Future<List<TestInfoModel>> getTestList(List<String> hiveIds) async {
    return await _apidao.getAllItems(hiveIds) as List<TestInfoModel>;
  }

  @override
  Future<bool> updateATestDataDownloadedToDB(String testHiveId) async {
    TestInfoModel testInfoModel = await _apidao.getItem(testHiveId) as TestInfoModel;
    testInfoModel.isDownloaded = true;
    return await _apidao.addItem(testInfoModel.toHiveObject(), testHiveId);
  }


}
