part of 'part_two_cubit.dart';

abstract class PartTwoState {}

class PartTwoInitial extends PartTwoState {}

// load content
class PartTwoLoading extends PartTwoState {}

class PartTwoContentLoaded extends PartTwoState {
  final int currentQuestionIndex;
  final int currentQuestionNumber;
  final int questionListSize;
  final String question;
  final List<String> answers;
  final Answer userAnswer;
  final Answer correctAnswer;
  final String audioPath;
  final String? note;

  PartTwoContentLoaded({
    this.note,
    required this.currentQuestionNumber,
    required this.currentQuestionIndex,
    required this.questionListSize,
    required this.correctAnswer,
    required this.userAnswer,
    required this.answers,
    required this.audioPath,
    required this.question,
  });
}

class PartTwoCheckedAnswer extends PartTwoState {}
