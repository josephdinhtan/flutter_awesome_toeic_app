part of 'part_five_cubit.dart';

abstract class PartFiveState {}

class PartFiveInitial extends PartFiveState {}

// load content
class PartFiveLoading extends PartFiveState {}

class PartFiveContentLoaded extends PartFiveState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartFiveModel partFiveModel;
  final UserAnswer userAnswer;
  final bool userChecked;

  PartFiveContentLoaded({
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.userChecked,
    required this.partFiveModel,
    required this.userAnswer,
  });
}

class PartFiveCheckedAnswer extends PartFiveState {}
