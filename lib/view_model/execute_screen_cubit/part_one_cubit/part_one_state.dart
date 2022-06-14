part of 'part_one_cubit.dart';

abstract class PartOneState {}

class PartOneInitial extends PartOneState {}

// load content
class PartOneLoading extends PartOneState {}

class PartOneContentLoaded extends PartOneState {
  final int currentQuestionNumber;
  final int questionListSize;
  final List<String> answers;
  final UserAnswer userAnswer;
  final UserAnswer correctAnswer;
  final String audioPath;
  final String picturePath;

  PartOneContentLoaded({
    required this.currentQuestionNumber,
    required this.questionListSize,
    required this.correctAnswer,
    required this.userAnswer,
    required this.answers,
    required this.audioPath,
    required this.picturePath,
  });
}

class PartOneCheckedAnswer extends PartOneState {}
