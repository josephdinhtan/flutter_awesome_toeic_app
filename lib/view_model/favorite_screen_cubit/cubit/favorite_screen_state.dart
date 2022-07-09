// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_screen_cubit.dart';

@immutable
abstract class FavoriteScreenState {}

class FavoriteScreenInitial extends FavoriteScreenState {}

class FavoriteListLoading extends FavoriteScreenState {}

class FavoriteListLoaded extends FavoriteScreenState {
  final List<QuestionNoteModel>? questionNoteList;
  FavoriteListLoaded({
    required this.questionNoteList,
  });
}

class FavoriteListChange extends FavoriteScreenState {
  final List<QuestionNoteModel>? questionNoteList;
  FavoriteListChange({
    required this.questionNoteList,
  });
}

class Failure extends FavoriteScreenState {}
