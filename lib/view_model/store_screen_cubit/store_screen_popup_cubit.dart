import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/business_models/book_info_model.dart';
import '../../domain/save_to_db_use_cases/save_a_store_book_to_db_use_case.dart';

part 'store_screen_popup_state.dart';

class StoreScreenPopupCubit extends Cubit<StoreScreenPopupState> {
  StoreScreenPopupCubit() : super(StoreScreenPopupInitial());
  final SaveAStoreBookToDbUseCase _saveABookUseCase = SaveAStoreBookToDbUseCase();

  Future<void> displayBookItemPopup() async {
    emit(StoreScreenPopupItemDisplay());
  }

  Future<void> buyABookItem(BookInfoModel bookInfoModel) async {
    emit(StoreScreenPopupItemBuying());
    bool saveOk = false;
    if(kIsWeb) {
      // save to firebase
      await Future.delayed(const Duration(milliseconds: 1000));
      saveOk = false;
    } else {
      saveOk = await _saveABookUseCase.saveANewBookToDb(bookInfoModel);
    }
    if (saveOk) {
      emit(StoreScreenPopupItemBought());
    } else {
      emit(StoreScreenPopupItemBuyFail());
    }
  }
}
