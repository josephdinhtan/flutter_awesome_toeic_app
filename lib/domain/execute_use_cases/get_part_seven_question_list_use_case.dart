import '../../data/di/injection.dart';
import '../../data/repositories/execute_repository/part_seven_repository/part_seven_repository.dart';

import '../../data/business_models/execute_models/part_seven_model.dart';

class GetPartSevenQuestionListUseCase {
  final _repository = getIt.get<PartSevenRepository>();

  Future<List<PartSevenModel>> getContent(List<String> ids) async {
    return await _repository.getQuestionList(ids);
  }
}
