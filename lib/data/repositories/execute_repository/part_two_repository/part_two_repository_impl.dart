import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_two_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_two_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_two_repository/part_two_repository.dart';

class PartTwoRepositoryImpl implements PartTwoRepository {
  @override
  PartTwoApi api;

  PartTwoRepositoryImpl({required this.api});

  @override
  Future<List<PartTwoModel>> getPartTwoQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
