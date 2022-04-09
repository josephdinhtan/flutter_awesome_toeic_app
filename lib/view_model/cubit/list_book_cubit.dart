import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/dataproviders/book_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';
import 'package:flutter_toeic_quiz2/data/repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'list_book_state.dart';

class ListBookCubit extends Cubit<ListBookState> {
  final BookRepository repository = BookRepository(api: BookApi());
  ListBookCubit() : super(ListBookInitial());

  Future<void> getListBook() async {
    emit(ListBookloading());
    try {
      final List<BookInfor> listBook = await repository.get();
      print("tandq list Book loaded");
      emit(ListBookLoaded(listBook: listBook));
    } catch (error) {
      emit(Failure());
    }
  }
}
