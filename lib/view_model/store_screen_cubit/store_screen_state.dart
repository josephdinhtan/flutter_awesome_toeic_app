part of 'store_screen_cubit.dart';

abstract class StoreScreenState {}

class StoreScreenInitial extends StoreScreenState {}

class StoreScreenBooksLoading extends StoreScreenState {}

class StoreScreenBooksLoaded extends StoreScreenState {
  List<BookInfoModel> bookInfoModelList;

  StoreScreenBooksLoaded({required this.bookInfoModelList});
}