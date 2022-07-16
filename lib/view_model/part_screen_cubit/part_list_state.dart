// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'part_list_cubit.dart';

abstract class PartListState {}

class PartListInitial extends PartListState {}

class PartListLoading extends PartListState {}

class PartListLoaded extends PartListState {
  List<PartModel> partListModel;
  int listeningScore;
  int readingScore;
  late int totalScore;
  PartListLoaded({
    required this.partListModel,
    required this.listeningScore,
    required this.readingScore,
  }) {
    totalScore = listeningScore + readingScore;
  }
}

class Failure extends PartListState {}
