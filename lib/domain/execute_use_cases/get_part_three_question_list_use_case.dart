import '../../data/di/injection.dart';

import '../../data/business_models/execute_models/part_three_model.dart';
import '../../data/repositories/execute_repository/part_three_repository/part_three_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartThreeQuestionListUseCase
    implements BaseUseCase<List<PartThreeModel>, List<String>> {
  final _repository = getIt.get<PartThreeRepository>();

  @override
  Future<List<PartThreeModel>> perform(ids) async {
    return await _repository.getQuestionList(ids);
  }
}
