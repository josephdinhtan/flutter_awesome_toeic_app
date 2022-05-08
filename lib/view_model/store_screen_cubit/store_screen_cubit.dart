import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:meta/meta.dart';

import '../../domain/get_store_item_list_use_case.dart';

part 'store_screen_state.dart';

class StoreScreenCubit extends Cubit<StoreScreenState> {
  StoreScreenCubit() : super(StoreScreenInitial());
  GetStoreItemListUseCase useCase = GetStoreItemListUseCase();

  Future<void> getBookListFromNetwork() async {
    emit(StoreScreenBooksLoading());
    final bookInfoList = await useCase.getListInfo();
    emit(StoreScreenBooksLoaded(bookInfoModelList: bookInfoList));
  }
}
