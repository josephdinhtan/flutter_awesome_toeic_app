import 'dart:async';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/book_network_object.dart';

abstract class StoreRepository {
  Future<List<BookNetworkObject>> getBookList();
  Future<bool> saveABookToDb(BookNetworkObject networkBookInfoModel);
}
