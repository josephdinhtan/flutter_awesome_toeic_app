import 'dart:developer';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/daos/base_dao/base_dao.dart';

import '../../business_models/part_model.dart';
import '../../data_providers/daos/part_dao.dart';
import 'part_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const _logTag = "PartRepositoryImpl";

class PartRepositoryImpl implements PartRepository {
  late BaseDao _dao = PartDao();

  @override
  Future<List<PartModel>> getPartList(List<String> ids) async {
    if (LogEnable) log('$_logTag getPartList(ids) started');
    List<PartModel> res = await _dao.getAllItems(ids) as List<PartModel>;
    if (LogEnable)
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    return res;
  }
}
