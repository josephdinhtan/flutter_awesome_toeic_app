import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../core_utils/global_configuration.dart';
import '../../data/business_models/part_model.dart';
import '../../data/di/injection.dart';
import '../../domain/get_book_detail_use_case/get_list_part_use_case.dart';

part 'part_list_state.dart';

const _logTag = "PartListCubit";

class PartListCubit extends Cubit<PartListState> {
  final useCase = getIt.get<GetListPartUseCase>();

  PartListCubit() : super(PartListInitial());

  Future<void> getInitContent(List<String> ids) async {
    emit(PartListLoading());
    try {
      if (logEnable) log('$_logTag getInitContent(ids) started');
      final List<PartModel> partList = await useCase.perform(ids);
      if (logEnable) {
        log('$PartListCubit getInitContent() done items.length: ${partList.length}');
      }
      emit(PartListLoaded(partListModel: partList));
    } catch (error) {
      emit(Failure());
    }
  }
}
