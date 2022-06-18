import 'dart:developer';

import '../../../core_utils/global_configuration.dart';
import '../../business_models/part_model.dart';
import '../../data_providers/daos/part_dao.dart';
import '../../di/injection.dart';
import 'part_repository.dart';

const _logTag = "PartRepositoryImpl";

class PartMobileRepositoryImpl implements PartRepository {
  final _dao = getIt.get<PartDao>();

  @override
  Future<List<PartModel>> getPartList(List<String> ids) async {
    if (logEnable) log('$_logTag getPartList(ids) started');
    List<PartModel> res = await _dao.queryAll(ids);
    if (logEnable) {
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    }
    return res;
  }
}
