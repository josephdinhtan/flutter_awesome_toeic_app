import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

import '../../../base_api_dao/baseAPIDAO.dart';
import '../../../business_models/part_models/part_five_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../data_providers/apis/part_execute_apis/part_five_api.dart';
import '../../../data_source/daos/part_execute_daos/part_five_dao.dart';

class PartFiveRepositoryImpl implements PartFiveRepository {

  @override
  late BaseAPIDAO _apidao;

  PartFiveRepositoryImpl(){
    if(kIsWeb) {
      _apidao = PartFiveApi();
    } else {
      _apidao = PartFiveDAO();
    }
  }

  @override
  Future<List<PartFiveModel>> getPartFiveQuestionList() async {
    return await _apidao.getAllItems([]) as List<PartFiveModel>;
  }
}
