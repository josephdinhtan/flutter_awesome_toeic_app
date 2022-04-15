import 'package:bloc/bloc.dart';
import '../../../data/dataproviders/execute_api/part_one_api.dart';
import '../../../data/models/part_models/part_one_model.dart';
import '../../../data/repositories/execute_repository/part_one_repository/part_one_repository_impl.dart';
import '../../../domain/execute_use_cases/base_get_content_use_case.dart';
import '../../../domain/execute_use_cases/get_part_one_content_use_case.dart';

part 'part_one_state.dart';

class PartOneCubit extends Cubit<PartOneState> {
  PartOneCubit() : super(PartOneInitial());
  BaseGetContentUseCase useCase = GetPartOneContentUseCase(repository: PartOneRepositoryImpl(api: PartOneApi()));

  Future<void> getContent() async {
    emit(PartOneLoading());
    final partOneModel = await useCase.getContent();
    emit(PartOneContentLoaded(partOneModel: partOneModel));
  }
}
