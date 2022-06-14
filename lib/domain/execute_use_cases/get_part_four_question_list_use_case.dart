import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_repository.dart';

import '../../data/business_models/execute_models/part_four_model.dart';

class GetPartFourQuestionListUserCase {
  PartFourRepository repository;

  GetPartFourQuestionListUserCase({required this.repository});

  Future<List<PartFourModel>> getContent() {
    return Future.value(repository.getPartFourQuestionList());
  }
}
