import 'package:flutter_toeic_quiz2/data/data_providers/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_info_model.dart';

import 'part_repository.dart';

class PartRepositoryImpl implements PartRepository {
  BaseApi api;

  PartRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<PartInfoModel>> getPartList() async {
    // check here if it web flatform or doesn't have local database
    return await api.getList();
  }
}
