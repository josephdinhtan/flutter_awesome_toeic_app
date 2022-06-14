import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import '../../data/business_models/book_model.dart';
import '../../domain/get_from_db_use_case/get_list_book_use_case.dart';

part 'book_list_state.dart';

const logTag = "BookListCubit";

class BookListCubit extends Cubit<BookListState> {
  final useCase = GetListBookUseCase();

  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    try {
      final List<BookModel> listBook = await useCase.getListInfo();
      if (LogEnable)
        log("$logTag listBook Loaded: listBook ${listBook[0].toString()}");
      emit(BookListLoaded(bookListModel: listBook));
    } catch (error) {
      emit(Failure());
    }
  }
}
