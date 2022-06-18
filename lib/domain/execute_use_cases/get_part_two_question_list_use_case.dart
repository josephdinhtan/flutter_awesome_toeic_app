import '../../data/business_models/execute_models/part_two_model.dart';
import '../../data/di/injection.dart';
import '../../data/repositories/execute_repository/part_two_repository/part_two_mobile_repository_impl.dart';
import '../../data/repositories/execute_repository/part_two_repository/part_two_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartTwoQuestionListUseCase
    implements BaseUseCase<List<PartTwoModel>, List<String>> {
  // need Dependency injection here refer to di folder in data
  //PartTwoRepository repository = getRepocitory();
  final repository = getIt.get<PartTwoRepository>();

  @override
  Future<List<PartTwoModel>> perform(ids) async {
    return await repository.getQuestionList(ids);
  }
}
