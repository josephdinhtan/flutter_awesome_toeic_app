import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_seven_repository/part_seven_repository.dart';

import '../../../business_models/execute_models/part_seven_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_seven_api.dart';

class PartSevenRepositoryImpl implements PartSevenRepository {
  @override
  PartSevenApi api;

  PartSevenRepositoryImpl({required this.api});

  @override
  Future<List<PartSevenModel>> getPartSevenQuestionList() {
    return Future.value(api.getFakeQuestionList());
  }
}
