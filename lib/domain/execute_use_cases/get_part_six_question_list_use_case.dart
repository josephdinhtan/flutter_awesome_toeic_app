import '../../data/di/injection.dart';
import '../../data/repositories/execute_repository/part_six_repository/part_six_repository.dart';

import '../../data/business_models/execute_models/part_six_model.dart';

class GetPartSixQuestionListUseCase {
  final _repository = getIt.get<PartSixRepository>();

  Future<List<PartSixModel>> getContent(List<String> ids) async {
    return await _repository.getQuestionList(ids);
  }
}
