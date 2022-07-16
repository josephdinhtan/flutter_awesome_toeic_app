// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'part_one_cubit.dart';

abstract class PartOneState {}

class PartOneInitial extends PartOneState {}

// load content
class PartOneLoading extends PartOneState {}

class PartOneContentLoaded extends PartOneState {
  final int currentQuestionNumber;
  final int questionListSize;
  final List<String> answers;
  final Answer userAnswer;
  final Answer correctAnswer;
  final String audioPath;
  final String picturePath;
  final String? note;

  PartOneContentLoaded({
    this.note,
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
