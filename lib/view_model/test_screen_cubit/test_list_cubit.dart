import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/dataproviders/test_api.dart';
import 'package:flutter_toeic_quiz2/data/repositories/test_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/test_info_model.dart';

part 'test_list_state.dart';

class TestListCubit extends Cubit<TestListState> {
  final TestRepository repository = TestRepository(api: TestApi());

  TestListCubit() : super(TestListInitial());

  Future<void> getListTest() async {
    emit(TestListLoading());
    try {
      final List<TestInfoModel> testList = await repository.get();
      print("tandq list test loaded");
      emit(TestListLoaded(
        testListModel: testList,
      ));
    } catch (error) {
      emit(Failure());
    }
  }
}
