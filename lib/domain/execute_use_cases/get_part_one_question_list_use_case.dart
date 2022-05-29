import '../../data/business_models/part_models/part_one_model.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

class GetPartOneQuestionListUseCase {
  PartOneRepository repository;

  GetPartOneQuestionListUseCase({required this.repository});

  Future<List<PartOneModel>> getContent() {
    // it may include boxId here
    return Future.value(repository.getPartOneQuestionList());
  }
}
