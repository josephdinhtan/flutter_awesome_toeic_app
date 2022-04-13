import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/dataproviders/book_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  final BookRepository repository = BookRepository(api: BookApi());

  BookListCubit() : super(BookListInitial());

  Future<void> getListBook() async {
    emit(BookListLoading());
    try {
      final List<BookInfoModel> listBook = await repository.get();
      print("tandq list Book loaded");
      emit(BookListLoaded(bookListModel: listBook));
    } catch (error) {
      emit(Failure());
    }
  }
}
