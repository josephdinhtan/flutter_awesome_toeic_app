import 'dart:developer';

import '../../core_utils/global_configuration.dart';
import '../../data/repositories/part_repository/part_repository.dart';
import '../base_use_case/BaseUseCase.dart';

import '../../data/business_models/part_model.dart';
import '../../data/di/injection.dart';

const _logTag = "GetListPartUseCase";

class GetListPartUseCase implements BaseUseCase<List<PartModel>, List<String>> {
  final repository = getIt.get<PartRepository>();

  @override
  Future<List<PartModel>> perform(ids) async {
    if (logEnable) log('$_logTag perform(ids) started');
    List<PartModel> res = await repository.getPartList(ids);
    if (logEnable) {
      log('$_logTag perform(ids) done items.length: ${res.length}');
    }
    return res;
  }
}
