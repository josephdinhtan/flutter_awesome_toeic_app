import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_mobile_repository_impl.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_repository.dart';

import '../../data/business_models/execute_models/part_four_model.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartFourQuestionListUserCase
    implements BaseUseCase<List<PartFourModel>, List<String>> {
  static final GetPartFourQuestionListUserCase _singleton =
      GetPartFourQuestionListUserCase._internal();
  GetPartFourQuestionListUserCase._internal();
  factory GetPartFourQuestionListUserCase() => _singleton;

  final PartFourRepository _repository = PartFourMobileRepositoryImpl();

  @override
  Future<List<PartFourModel>> perform(ids) async {
    return await _repository.getQuestionList(ids);
  }
}
