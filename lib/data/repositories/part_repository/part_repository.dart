import '../../models/part_info_model.dart';

abstract class PartRepository {
  Future<List<PartInfoModel>> getPartList();
}