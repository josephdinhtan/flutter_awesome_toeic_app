part of 'store_screen_cubit.dart';

abstract class StoreScreenState {}

class StoreScreenInitial extends StoreScreenState {}

class StoreScreenBooksLoading extends StoreScreenState {}

class StoreScreenBooksLoaded extends StoreScreenState {
  List<BookDto> bookDto;

  StoreScreenBooksLoaded({required this.bookDto});
}
