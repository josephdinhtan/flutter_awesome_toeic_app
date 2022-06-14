import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

import '../../../business_models/execute_models/part_five_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../data_providers/apis/part_execute_apis/part_five_api.dart';

class PartFiveRepositoryImpl implements PartFiveRepository {
  @override
  PartFiveApi api;

  PartFiveRepositoryImpl({required this.api});

  @override
  Future<List<PartFiveModel>> getPartFiveQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
