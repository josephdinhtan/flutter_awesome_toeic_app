
import '../../data/models/part_models/part_one_model.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository.dart';
import 'base_get_content_use_case.dart';

class GetPartOneContentUseCase implements BaseGetContentUseCase<PartOneModel> {
  PartOneRepository repository;

  GetPartOneContentUseCase({required this.repository});

  @override
  Future<PartOneModel> getContent() {// it may include boxId here
    return Future.value(repository.getPartOneQuestionContent());
  }
}