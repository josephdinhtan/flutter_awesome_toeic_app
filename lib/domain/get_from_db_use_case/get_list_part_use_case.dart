import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository_impl.dart';

import '../../data/business_models/part_info_model.dart';

class GetListPartUseCase {
  final PartRepository repository = PartRepositoryImpl();

  GetListPartUseCase();

  Future<List<PartInfoModel>> getListInfo() async {
    return await repository.getPartList();
  }
}
