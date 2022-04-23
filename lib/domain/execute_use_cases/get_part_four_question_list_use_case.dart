import 'package:flutter_toeic_quiz2/data/models/part_models/part_four_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_repository.dart';

class GetPartFourQuestionListUserCase {
  PartFourRepository repository;

  GetPartFourQuestionListUserCase({required this.repository});

  Future<List<PartFourModel>> getContent() {
    return Future.value(repository.getPartFourQuestionList());
  }
}
