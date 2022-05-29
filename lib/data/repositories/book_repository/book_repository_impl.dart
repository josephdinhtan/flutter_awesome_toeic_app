import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/data_providers/apis/book_api.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/book_dao.dart';

import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/book_info_model.dart';
import 'book_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BookRepositoryImpl implements BookRepository {
  late BaseAPIDAO _apidao;
  BookRepositoryImpl() {
    if(kIsWeb) {
      _apidao = BookApi();
    } else {
      _apidao = BookDAO();
    }
  }

  @override
  Future<List<BookInfoModel>> getBookList() async {
    return await _apidao.getAllItems() as List<BookInfoModel>;
  }
}
