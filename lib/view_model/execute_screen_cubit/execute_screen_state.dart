// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'execute_screen_cubit.dart';

abstract class ExecuteScreenState {}

class ExecuteScreenInitial extends ExecuteScreenState {}

class ExecuteScreenLoading extends ExecuteScreenState {}

class ExecuteContentLoaded extends ExecuteScreenState {
  final int currentQuestionNumber;
  final int questionListSize;
  final QuestionGroupModel questionGroupModel;
  final List<Answer> userAnswer;
  final List<Answer> correctAnswer;
  final String? note;
  final bool needHideAnsQues;
  ExecuteContentLoaded({
    required this.needHideAnsQues,
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.questionGroupModel,
    required this.userAnswer,
    required this.correctAnswer,
    this.note,
  });
}
