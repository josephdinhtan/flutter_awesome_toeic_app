import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_six_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_six_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_six_repository/part_six_repository.dart';

class PartSixRepositoryImpl implements PartSixRepository {
  @override
  PartSixApi api;

  PartSixRepositoryImpl({required this.api});

  @override
  Future<List<PartSixModel>> getPartSixQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
