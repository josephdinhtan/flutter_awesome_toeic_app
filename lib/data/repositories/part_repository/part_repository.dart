import '../../business_models/part_model.dart';

abstract class PartRepository {
  Future<List<PartModel>> getPartList(List<String> ids);
  Future<bool> savePartList(List<PartModel> partModels);
}
