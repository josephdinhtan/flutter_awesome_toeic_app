import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/data_source/daos/book_dao.dart';
import '../../data/data_providers/apis/book_api.dart';
import '../../data/business_models/book_info_model.dart';
import '../../data/repositories/book_repository/book_repository_impl.dart';
import '../../domain/get_from_db_use_case/get_list_book_use_case.dart';
import '../../utils/misc.dart';

part 'book_list_state.dart';

const logTag = "BookListCubit";

class BookListCubit extends Cubit<BookListState> {
  final useCase = GetListBookUseCase();

  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    try {
      final List<BookInfoModel> listBook = await useCase.getListInfo();
      if (DebugLogEnable)
        log("$logTag listBook Loaded: listBook ${listBook[0].toString()}");
      emit(BookListLoaded(bookListModel: listBook));
    } catch (error) {
      emit(Failure());
    }
  }
}
