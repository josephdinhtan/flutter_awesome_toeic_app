import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/part_execute_apis/part_three_api.dart';

import '../../../business_models/execute_models/part_three_model.dart';
import 'part_three_repository.dart';

class PartThreeWebRepositoryImpl implements PartThreeRepository {
  final BaseApi _api = PartThreeApi();

  @override
  Future<List<PartThreeModel>> getQuestionList(List<String> ids) async {
    return await _api.getAllItems(ids) as List<PartThreeModel>;
  }
}
