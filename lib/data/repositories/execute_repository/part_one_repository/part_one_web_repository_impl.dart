import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/part_execute_apis/part_one_api.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../business_models/execute_models/part_one_model.dart';

class PartOneWebRepositoryImpl implements PartOneRepository {
  BaseApi _api = PartOneApi();

  @override
  Future<List<PartOneModel>> getQuestionList(List<String> ids) async {
    return await _api.getAllItems(ids) as List<PartOneModel>;
  }
}
