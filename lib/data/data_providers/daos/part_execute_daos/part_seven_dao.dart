import '../../../business_models/execute_models/part_seven_model.dart';
import '../../hive_objects/part_execute_hive_object/part_seven_hive_object.dart';
import '../base_dao/base_dao.dart';

class PartSevenDao implements BaseDao<PartSevenModel, PartSevenHiveObject> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartSevenHiveObject item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartSevenModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartSevenModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartSevenHiveObject item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
