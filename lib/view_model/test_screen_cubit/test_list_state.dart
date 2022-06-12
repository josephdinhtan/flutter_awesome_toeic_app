part of 'test_list_cubit.dart';

abstract class TestListState {}

class TestListInitial extends TestListState {}

class TestListLoading extends TestListState {}

class TestListLoaded extends TestListState {
  List<TestInfoModel> testListModel;
  TestListLoaded({required this.testListModel});
}

class Failure extends TestListState {}
