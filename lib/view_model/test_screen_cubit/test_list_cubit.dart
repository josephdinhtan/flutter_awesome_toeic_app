import 'package:bloc/bloc.dart';

import '../../data/business_models/test_model.dart';
import '../../data/di/injection.dart';
import '../../domain/get_book_detail_use_case/get_list_test_use_case.dart';

part 'test_list_state.dart';

class TestListCubit extends Cubit<TestListState> {
  final useCase = getIt.get<GetListTestUseCase>();

  TestListCubit() : super(TestListInitial());

  Future<void> getInitContent(List<String> hiveIds) async {
    emit(TestListLoading());
    try {
      final List<TestModel> testList = await useCase.perform(hiveIds);
      emit(TestListLoaded(
        testListModel: testList,
      ));
    } catch (error) {
      emit(Failure());
    }
  }
}
