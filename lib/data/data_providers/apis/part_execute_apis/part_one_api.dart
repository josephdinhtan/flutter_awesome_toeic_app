import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/base_network_object/network_base_object.dart';
import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_part_object/part_one_question_network_object.dart';

import '../../../business_models/part_models/answer_enum.dart';
import '../../../business_models/part_models/part_one_model.dart';
import '../base_api.dart';

class PartOneApi
    implements BaseApi<PartOneModel, PartOneQuestionNetworkObject> {
  @override
  Future<bool> addItem(
      NetworkBaseObject<BaseBusinessModel> item, String hiveId) {
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
  Future<bool> updateItem(NetworkBaseObject<BaseBusinessModel> item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
