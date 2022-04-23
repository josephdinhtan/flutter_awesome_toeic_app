import '../../data/models/part_models/part_five_model.dart';
import '../../data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

class GetPartFiveQuestionListUseCase {
  PartFiveRepository repository;

  GetPartFiveQuestionListUseCase({required this.repository});

  Future<List<PartFiveModel>> getContent() {
    // it may include boxId here
    return Future.value(repository.getPartFiveQuestionList());
  }
}
