import 'dart:developer';

import 'package:flutter_toeic_quiz2/utils/misc.dart';

import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/part_info_model.dart';
import '../../data_providers/apis/part_api.dart';
import '../../data_source/daos/part_dao.dart';
import 'part_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const _logTag = "PartRepositoryImpl";

class PartRepositoryImpl implements PartRepository {
  late BaseAPIDAO _apiDAO;

  PartRepositoryImpl() {
    if (kIsWeb) {
      _apiDAO = PartApi();
    } else {
      _apiDAO = PartDAO();
    }
  }

  @override
  Future<List<PartInfoModel>> getPartList(List<String> ids) async {
    if (DebugLogEnable) log('$_logTag getPartList(ids) started');
    List<PartInfoModel> res =
        await _apiDAO.getAllItems(ids) as List<PartInfoModel>;
    if (DebugLogEnable)
      log('$_logTag getPartList(ids) done items.length: ${res.length}');
    return res;
  }
}
