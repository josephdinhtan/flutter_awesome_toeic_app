import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../../core_utils/global_configuration.dart';
import '../../data_providers/apis/part_api.dart';

import '../../business_models/part_model.dart';
import 'part_repository.dart';

const _logTag = "PartRepositoryImpl";

class PartWebRepositoryImpl implements PartRepository {
  final _api = GetIt.I.get<PartApi>();

  @override
  Future<List<PartModel>> getPartList(List<String> ids) async {
    if (logEnable) log('$_logTag getPartList(ids) started');
    List<PartModel> res = await _api.queryAll(ids);
    if (logEnable) {
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    }
    return res;
  }

  @override
  Future<bool> savePartList(List<PartModel> partModels) {
    // TODO: implement savePartList
    throw UnimplementedError();
  }
}
