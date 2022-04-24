part of 'part_two_cubit.dart';

abstract class PartTwoState {}

class PartTwoInitial extends PartTwoState {}

// load content
class PartTwoLoading extends PartTwoState {}

class PartTwoContentLoaded extends PartTwoState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartTwoModel partTwoModel;
  final UserAnswer userAnswer;
  final UserAnswer correctAnswer;

  PartTwoContentLoaded({
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.partTwoModel,
    required this.userAnswer,
  });
}

class PartTwoCheckedAnswer extends PartTwoState {}
