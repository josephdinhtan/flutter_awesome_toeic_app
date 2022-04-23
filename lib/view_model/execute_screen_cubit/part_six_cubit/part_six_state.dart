part of 'part_six_cubit.dart';

@immutable
abstract class PartSixState {}

class PartSixInitial extends PartSixState {}

class PartSixLoading extends PartSixState {}
class PartSixContentLoaded extends PartSixState {
  final int currentQuestionNumber;
  final int questionListSize;
  final PartSixModel partSixModel;
  final List<UserAnswer> userAnswer;
  final List<UserAnswer> correctAnswer;

  PartSixContentLoaded({
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.partSixModel,
    required this.userAnswer,
  });
}

class PartSixCheckedAnswer extends PartSixState {}
