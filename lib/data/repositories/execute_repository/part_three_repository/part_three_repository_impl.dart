import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_three_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_three_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_repository.dart';

class PartThreeRepositoryImpl implements PartThreeRepository {
  @override
  PartThreeApi api;

  PartThreeRepositoryImpl({required this.api});

  @override
  Future<List<PartThreeModel>> getPartThreeQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
