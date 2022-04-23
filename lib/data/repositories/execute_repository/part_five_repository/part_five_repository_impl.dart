import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_five_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_five_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

class PartFiveRepositoryImpl implements PartFiveRepository {
  @override
  PartFiveApi api;

  PartFiveRepositoryImpl({required this.api});

  @override
  Future<List<PartFiveModel>> getPartFiveQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
