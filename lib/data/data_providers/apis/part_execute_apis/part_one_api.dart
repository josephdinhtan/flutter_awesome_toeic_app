import 'package:flutter_toeic_quiz2/data/data_providers/dtos/part_dto/part_one_dto.dart';

import '../../../business_models/execute_models/part_one_model.dart';
import '../base_api/base_api.dart';

class PartOneApi implements BaseApi<PartOneModel, PartOneDto> {
  @override
  Future<bool> addItem(PartOneDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartOneModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartOneModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(PartOneDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
