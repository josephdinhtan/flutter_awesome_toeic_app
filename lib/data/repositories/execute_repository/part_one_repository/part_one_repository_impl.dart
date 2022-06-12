import 'package:flutter_toeic_quiz2/data/data_providers/apis/part_execute_apis/part_one_api.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/part_execute_daos/part_one_dao.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

import '../../../base_api_dao/baseAPIDAO.dart';
import '../../../business_models/part_models/part_one_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PartOneRepositoryImpl implements PartOneRepository {
  late BaseAPIDAO _apiDAO;

  PartOneRepositoryImpl() {
    if (kIsWeb) {
      _apiDAO = PartOneApi();
    } else {
      _apiDAO = PartOneDAO();
    }
  }

  @override
  Future<List<PartOneModel>> getQuestionList(List<String> ids) async {
    return await _apiDAO.getAllItems(ids) as List<PartOneModel>;
  }
}
