import '../../data/models/part_models/part_two_model.dart';
import '../../data/repositories/execute_repository/part_two_repository/part_two_repository.dart';

class GetPartTwoQuestionListUseCase {
  PartTwoRepository repository;

  GetPartTwoQuestionListUseCase({required this.repository});

  Future<List<PartTwoModel>> getContent() {
    // it may include boxId here
    return Future.value(repository.getPartTwoQuestionList());
  }
}
