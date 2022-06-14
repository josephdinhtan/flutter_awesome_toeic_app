import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_repository.dart';

import '../../data/business_models/execute_models/part_three_model.dart';

class GetPartThreeQuestionListUserCase {
  PartThreeRepository repository;

  GetPartThreeQuestionListUserCase({required this.repository});

  Future<List<PartThreeModel>> getContent() {
    return Future.value(repository.getPartThreeQuestionList());
  }
}
