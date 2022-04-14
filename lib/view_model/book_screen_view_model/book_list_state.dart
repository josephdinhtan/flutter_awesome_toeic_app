part of 'book_list_cubit.dart';

abstract class BookListState {}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState {}

class BookListLoaded extends BookListState {
  List<BookInfoModel> bookListModel;
  BookListLoaded({required this.bookListModel});
}

class Failure extends BookListState {}
