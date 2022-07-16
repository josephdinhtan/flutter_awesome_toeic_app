import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/business_models/test_model.dart';
import '../../domain/get_book_detail_use_case/get_test_list_use_case copy.dart';

part 'test_list_state.dart';

class TestListCubit extends Cubit<TestListState> {
  final useCase = GetIt.I.get<GetTestListUseCase>();
  late List<String> _hiveIds;
  List<TestModel> testList = [];

  TestListCubit() : super(TestListInitial());

  Future<void> getInitContent(List<String> hiveIds) async {
    _hiveIds = hiveIds;
    emit(TestListLoading());
    try {
      testList = await useCase.perform(hiveIds);
      emit(TestListLoaded(
        testListModel: testList,
      ));
    } catch (error) {
      emit(Failure());
    }
  }

  Future<void> refresh() async {
    try {
      testList = await useCase.perform(_hiveIds);
      emit(TestListLoaded(
        testListModel: testList,
      ));
    } catch (error) {
      emit(Failure());
    }
  }
}
