import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

import '../../../business_models/part_models/part_one_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_one_api.dart';

class PartOneRepositoryImpl implements PartOneRepository {
  @override
  PartOneApi api;

  PartOneRepositoryImpl({required this.api});

  @override
  Future<List<PartOneModel>> getPartOneQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
