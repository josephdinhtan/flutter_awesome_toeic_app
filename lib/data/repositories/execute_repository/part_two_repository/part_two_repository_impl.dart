import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_two_repository/part_two_repository.dart';

import '../../../business_models/part_models/part_two_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_two_api.dart';

class PartTwoRepositoryImpl implements PartTwoRepository {
  @override
  PartTwoApi api;

  PartTwoRepositoryImpl({required this.api});

  @override
  Future<List<PartTwoModel>> getPartTwoQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
