import '../../business_models/book_model.dart';
import '../dtos/book_dto.dart';
import 'base_api/base_api.dart';

class BookApi implements BaseApi<BookModel, BookDto> {
  @override
  Future<bool> insert(BookDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> queryAll(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<BookModel?> query(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> update(BookDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
