import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/part_execute_daos/part_one_dao.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../business_models/execute_models/part_one_model.dart';

class PartOneMobileRepositoryImpl implements PartOneRepository {
  BaseDao _dao = PartOneDao();

  @override
  Future<List<PartOneModel>> getQuestionList(List<String> ids) async {
    return await _dao.getAllItems(ids) as List<PartOneModel>;
  }
}
