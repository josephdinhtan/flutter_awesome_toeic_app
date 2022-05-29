import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_five_repository/part_five_repository_impl.dart';

import '../../data/business_models/part_models/part_five_model.dart';
import '../../data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

class GetPartFiveQuestionListUseCase {
  PartFiveRepository repository = PartFiveRepositoryImpl();

  GetPartFiveQuestionListUseCase();

  Future<List<PartFiveModel>> getContent() {
    // it may include boxId here
    return Future.value(repository.getPartFiveQuestionList());
  }
}
