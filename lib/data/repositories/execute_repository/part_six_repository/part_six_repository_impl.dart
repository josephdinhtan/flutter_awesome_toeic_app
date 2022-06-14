import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_six_repository/part_six_repository.dart';

import '../../../business_models/execute_models/part_six_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_six_api.dart';
import '../base_repository/part_repository_base.dart';

class PartSixRepositoryImpl implements PartRepositoryBase, PartSixRepository {
  @override
  PartSixApi api;

  PartSixRepositoryImpl({required this.api});

  @override
  Future<List<PartSixModel>> getPartSixQuestionList() {
    return Future.value(api.getFakeQuestionList());
  }

  @override
  void saveQuestionToFavorite(
      {required String questionId, required String message}) {
    // TODO: implement saveQuestionToFavorite
  }
}
