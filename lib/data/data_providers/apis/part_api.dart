import '../../business_models/base_model/base_business_model.dart';
import '../../business_models/part_info_model.dart';
import '../network_response_models/base_network_object/network_base_object.dart';
import '../network_response_models/part_network_object.dart';
import 'base_api.dart';

class PartApi extends BaseApi<PartInfoModel, PartNetworkObject> {
  @override
  Future<bool> addItem(NetworkBaseObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(NetworkBaseObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
