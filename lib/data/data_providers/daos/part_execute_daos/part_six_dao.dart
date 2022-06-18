import '../../../business_models/execute_models/part_six_model.dart';
import '../../hive_objects/part_execute_hive_object/part_six_hive_object.dart';
import '../base_dao/base_dao.dart';

class PartSixDao implements BaseDao<PartSixModel, PartSixHiveObject> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartSixHiveObject item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartSixModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartSixModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartSixHiveObject item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
