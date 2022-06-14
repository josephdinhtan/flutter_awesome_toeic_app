import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_mobile_repository_impl.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_repository.dart';

import '../../data/business_models/execute_models/part_three_model.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartThreeQuestionListUserCase
    implements BaseUseCase<List<PartThreeModel>, List<String>> {
  static final GetPartThreeQuestionListUserCase _singleton =
      GetPartThreeQuestionListUserCase._internal();
  GetPartThreeQuestionListUserCase._internal();
  factory GetPartThreeQuestionListUserCase() => _singleton;

  final PartThreeRepository _repository = PartThreeMobileRepositoryImpl();

  @override
  Future<List<PartThreeModel>> perform(ids) async {
    return await _repository.getQuestionList(ids);
  }
}
