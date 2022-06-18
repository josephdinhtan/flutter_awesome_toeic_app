import '../../data/business_models/execute_models/part_four_model.dart';
import '../../data/di/injection.dart';
import '../../data/repositories/execute_repository/part_four_repository/part_four_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartFourQuestionListUseCase
    implements BaseUseCase<List<PartFourModel>, List<String>> {
  final _repository = getIt.get<PartFourRepository>();

  @override
  Future<List<PartFourModel>> perform(ids) async {
    return await _repository.getQuestionList(ids);
  }
}
