import 'package:bloc/bloc.dart';

import '../../data/business_models/part_info_model.dart';
import '../../data/data_providers/apis/part_api.dart';
import '../../data/repositories/part_repository/part_repository_impl.dart';
import '../../domain/get_from_db_use_case/get_list_part_use_case.dart';

part 'part_list_state.dart';

class PartListCubit extends Cubit<PartListState> {
  final useCase = GetListPartUseCase();

  PartListCubit() : super(PartListInitial());

  Future<void> getInitContent() async {
    emit(PartListLoading());
    try {
      final List<PartInfoModel> partList = await useCase.getListInfo();
      emit(PartListLoaded(partListModel: partList));
    } catch (error) {
      emit(Failure());
    }
  }
}
