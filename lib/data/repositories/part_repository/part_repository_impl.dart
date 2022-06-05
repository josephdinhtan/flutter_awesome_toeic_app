
import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/part_info_model.dart';
import '../../data_providers/apis/part_api.dart';
import '../../data_source/daos/part_dao.dart';
import 'part_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PartRepositoryImpl implements PartRepository {
  late BaseAPIDAO _apidao;

  PartRepositoryImpl() {
    if(kIsWeb) {
      _apidao = PartApi();
    } else {
      _apidao = PartDAO();
    }
  }

  @override
  Future<List<PartInfoModel>> getPartList() async {
    return await _apidao.getAllItems([]) as List<PartInfoModel>;
  }
}
