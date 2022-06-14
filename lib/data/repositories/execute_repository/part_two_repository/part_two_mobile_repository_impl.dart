import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/part_execute_daos/part_two_dao.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_two_repository/part_two_repository.dart';

import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoMobileRepositoryImpl implements PartTwoRepository {
  final BaseDao _dao = PartTwoDao();

  @override
  Future<List<PartTwoModel>> getQuestionList(List<String> ids) async {
    return await _dao.getAllItems(ids) as List<PartTwoModel>;
  }
}
