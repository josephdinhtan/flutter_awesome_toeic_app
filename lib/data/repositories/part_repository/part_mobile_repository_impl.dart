import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../../core_utils/global_configuration.dart';
import '../../business_models/part_model.dart';
import '../../data_providers/daos/part_dao.dart';
import 'part_repository.dart';

const _logTag = "PartRepositoryImpl";

class PartMobileRepositoryImpl implements PartRepository {
  final _dao = GetIt.I.get<PartDao>();

  @override
  Future<List<PartModel>> getPartList(List<String> ids) async {
    if (logEnable) log('$_logTag getPartList(ids) started');
    List<PartModel> res = await _dao.queryAll(ids);
    if (logEnable) {
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    }
    return res;
  }

  @override
  Future<bool> savePartList(List<PartModel> partModels) async {
    for (final partModel in partModels) {
      final isOk = await _dao.insert(partModel.toHiveObject(), partModel.id);
      if (!isOk) return false;
    }
    return true;
  }
}
