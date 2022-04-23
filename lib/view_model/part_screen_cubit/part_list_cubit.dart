import 'package:bloc/bloc.dart';

import '../../data/data_providers/part_api.dart';
import '../../data/models/part_info_model.dart';
import '../../data/repositories/part_repository/part_repository_impl.dart';
import '../../domain/base_use_case.dart';
import '../../domain/get_list_part_use_case.dart';

part 'part_list_state.dart';

class PartListCubit extends Cubit<PartListState> {
  final BaseUseCase useCase =
      GetListPartUseCase(repository: PartRepositoryImpl(api: PartApi()));

  PartListCubit() : super(PartListInitial());

  Future<void> getPartList() async {
    emit(PartListLoading());
    try {
      final List<PartInfoModel> partList = await useCase.getListInfo();
      emit(PartListLoaded(partListModel: partList));
    } catch (error) {
      emit(Failure());
    }
  }
}
