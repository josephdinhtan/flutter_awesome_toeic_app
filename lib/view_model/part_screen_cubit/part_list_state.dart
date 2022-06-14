part of 'part_list_cubit.dart';

abstract class PartListState {}

class PartListInitial extends PartListState {}

class PartListLoading extends PartListState {}

class PartListLoaded extends PartListState {
  List<PartModel> partListModel;
  PartListLoaded({required this.partListModel});
}

class Failure extends PartListState {}
