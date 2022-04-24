part of 'part_four_cubit.dart';

@immutable
abstract class PartFourState {}

class PartFourInitial extends PartFourState {}

class PartFourLoading extends PartFourState {}
class PartFourContentLoaded extends PartFourState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartFourModel partFourModel;
  final List<UserAnswer> userAnswer;
  final List<UserAnswer> correctAnswer;

  PartFourContentLoaded({
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.partFourModel,
    required this.userAnswer,
  });
}

class PartFourCheckedAnswer extends PartFourState {}
