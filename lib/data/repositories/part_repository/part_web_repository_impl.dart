import 'dart:developer';

import '../../../core_utils/global_configuration.dart';
import '../../data_providers/apis/part_api.dart';
import '../../di/injection.dart';

import '../../business_models/part_model.dart';
import 'part_repository.dart';

const _logTag = "PartRepositoryImpl";

class PartWebRepositoryImpl implements PartRepository {
  final _api = getIt.get<PartApi>();

  @override
  Future<List<PartModel>> getPartList(List<String> ids) async {
    if (logEnable) log('$_logTag getPartList(ids) started');
    List<PartModel> res = await _api.queryAll(ids);
    if (logEnable) {
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    }
    return res;
  }
}
