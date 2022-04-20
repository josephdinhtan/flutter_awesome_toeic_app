import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_one_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_one_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

class PartOneRepositoryImpl implements PartOneRepository {
  @override
  PartOneApi api;

  PartOneRepositoryImpl({required this.api});

  @override
  Future<List<PartOneModel>> getPartOneQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
