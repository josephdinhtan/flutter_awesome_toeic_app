import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';

import '../../business_models/book_model.dart';
import '../dtos/book_dto.dart';

class BookApi implements BaseApi<BookModel, BookDto> {
  @override
  Future<bool> addItem(BookDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<BookModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(BookDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
