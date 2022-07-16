import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../core_utils/global_configuration.dart';
import '../../data/repositories/part_repository/part_repository.dart';
import '../base_use_case/BaseUseCase.dart';

import '../../data/business_models/part_model.dart';

const _logTag = "GetListPartUseCase";

class SavePartListUseCase implements BaseUseCase<bool, List<PartModel>> {
  final repository = GetIt.I.get<PartRepository>();

  @override
  Future<bool> perform(partModels) async {
    if (logEnable) log('$_logTag perform(ids) started');
    return await repository.savePartList(partModels);
  }
}
