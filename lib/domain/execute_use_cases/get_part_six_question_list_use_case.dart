import 'package:flutter_toeic_quiz2/data/models/part_models/part_six_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_six_repository/part_six_repository.dart';

class GetPartSixQuestionListUserCase {
  PartSixRepository repository;

  GetPartSixQuestionListUserCase({required this.repository});

  Future<List<PartSixModel>> getContent() {
    return Future.value(repository.getPartSixQuestionList());
  }
}
