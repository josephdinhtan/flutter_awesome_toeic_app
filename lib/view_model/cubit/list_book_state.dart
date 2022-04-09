part of 'list_book_cubit.dart';

@immutable
abstract class ListBookState {}

class ListBookInitial extends ListBookState {}

class ListBookloading extends ListBookState {}

class ListBookLoaded extends ListBookState {
  List<BookInfor> listBook;
  ListBookLoaded({required this.listBook});
}

class Failure extends ListBookState {}
