import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/execute_models/part_two_model.dart';
import '../../data/repositories/execute_repository/part_two_repository/part_two_repository.dart';
import '../../data/repositories/execute_repository/part_two_repository/part_two_mobile_repository_impl.dart';

class GetPartTwoQuestionListUseCase
    implements BaseUseCase<List<PartTwoModel>, List<String>> {
  static final GetPartTwoQuestionListUseCase _singleton =
      GetPartTwoQuestionListUseCase._internal();
  GetPartTwoQuestionListUseCase._internal();
  factory GetPartTwoQuestionListUseCase() => _singleton;

  // need Dependency injection here refer to di folder in data
  //PartTwoRepository repository = getRepocitory();
  PartTwoRepository repository = PartTwoMobileRepositoryImpl();

  @override
  Future<List<PartTwoModel>> perform(ids) async {
    return await repository.getQuestionList(ids);
  }
}
