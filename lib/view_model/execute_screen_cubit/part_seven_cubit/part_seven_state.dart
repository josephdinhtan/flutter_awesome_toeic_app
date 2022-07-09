part of 'part_seven_cubit.dart';

@immutable
abstract class PartSevenState {}

class PartSevenInitial extends PartSevenState {}

class PartSevenLoading extends PartSevenState {}

class PartSevenContentLoaded extends PartSevenState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartSevenModel partSevenModel;
  final List<UserAnswer> userAnswer;
  final List<UserAnswer> correctAnswer;
  final String? note;

  PartSevenContentLoaded({
    this.note,
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.partSevenModel,
    required this.userAnswer,
  });
}

class PartSevenCheckedAnswer extends PartSevenState {}
