import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/part_execute_apis/part_two_api.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_two_repository/part_two_repository.dart';

import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoWebRepositoryImpl implements PartTwoRepository {
  final BaseApi _api = PartTwoApi();

  @override
  Future<List<PartTwoModel>> getQuestionList(List<String> ids) async {
    return await _api.getAllItems(ids) as List<PartTwoModel>;
  }
}
