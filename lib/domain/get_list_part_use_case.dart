import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository.dart';

import '../data/models/part_info_model.dart';
import 'base_use_case.dart';

class GetListPartUseCase extends BaseUseCase<List<PartInfoModel>> {
  final PartRepository repository;

  GetListPartUseCase({
    required this.repository,
  });

  @override
  Future<List<PartInfoModel>> getListInfo() async {
    return await repository.getPartList();
  }
}
