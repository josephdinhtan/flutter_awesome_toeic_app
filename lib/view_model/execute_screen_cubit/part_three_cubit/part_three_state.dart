part of 'part_three_cubit.dart';

@immutable
abstract class PartThreeState {}

class PartThreeInitial extends PartThreeState {}

class PartThreeLoading extends PartThreeState {}

class PartThreeContentLoaded extends PartThreeState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartThreeModel partThreeModel;
  final List<UserAnswer> userAnswer;
  final List<UserAnswer> correctAnswer;
  final String? note;

  PartThreeContentLoaded({
    this.note,
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.partThreeModel,
    required this.userAnswer,
  });
}

class PartThreeCheckedAnswer extends PartThreeState {}
