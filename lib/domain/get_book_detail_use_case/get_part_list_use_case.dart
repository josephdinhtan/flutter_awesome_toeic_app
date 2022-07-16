import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../core_utils/global_configuration.dart';
import '../../data/repositories/part_repository/part_repository.dart';
import '../base_use_case/BaseUseCase.dart';

import '../../data/business_models/part_model.dart';

const _logTag = "GetListPartUseCase";

class GetPartListUseCase implements BaseUseCase<List<PartModel>, List<String>> {
  final repository = GetIt.I.get<PartRepository>();

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
