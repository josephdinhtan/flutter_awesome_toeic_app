part of 'part_one_cubit.dart';

abstract class PartOneState {}

class PartOneInitial extends PartOneState {}

// load content
class PartOneLoading extends PartOneState {}

class PartOneContentLoaded extends PartOneState {
  final PartOneModel partOneModel;
  PartOneContentLoaded({required this.partOneModel});
}

// controller
class PartOneSoundBack5Second extends PartOneState {}
class PartOneSoundForward5Second extends PartOneState {}