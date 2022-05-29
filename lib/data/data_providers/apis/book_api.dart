import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';

import '../../business_models/book_info_model.dart';
import '../network_response_models/network_book_object.dart';

class BookApi extends BaseApi<BookInfoModel, NetworkBookObject> {
  @override
  Future<bool> addItem(NetworkBaseObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems() {
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
