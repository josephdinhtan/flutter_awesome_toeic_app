import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/store_api/network_store_item_object.dart';
import 'package:flutter_toeic_quiz2/domain/download_use_case/download_book_cover_use_case.dart';

import '../../domain/save_to_db_use_cases/save_book_to_db_use_case.dart';

part 'store_screen_popup_state.dart';

final LOG_TAG = "StoreScreenPopupCubit";
class StoreScreenPopupCubit extends Cubit<StoreScreenPopupState> {
  StoreScreenPopupCubit() : super(StoreScreenPopupInitial());
  final SaveBookToDbUseCase _saveABookUseCase = SaveBookToDbUseCase();
  final DownloadBookCoverUseCase _downloadBookCoverUseCase = DownloadBookCoverUseCase();

  Future<void> displayBookItemPopup() async {
    emit(StoreScreenPopupItemDisplay());
  }

  Future<void> buyABookItem(NetworkStoreItemModel networkStoreItemModel) async {
    emit(StoreScreenPopupItemBuying());
    bool saveOk = false;
    if(kIsWeb) {
      // save to firebase
      await Future.delayed(const Duration(milliseconds: 1000));
      saveOk = false;
    } else {
      final downloadOK = await _downloadBookCoverUseCase.downloadBookCover(networkStoreItemModel.coverUrl);
      log("$LOG_TAG buyABookItem() download bookCover done downloadOK: $downloadOK");
      if(!downloadOK) {
        emit(StoreScreenPopupItemBuyFail());
        return;
      }
      saveOk = await _saveABookUseCase.saveANewBookToDb(networkStoreItemModel);
      log("$LOG_TAG buyABookItem() download save a book done saveOk: $saveOk");
    }
    if (saveOk) {
      emit(StoreScreenPopupItemBought());
    } else {
      emit(StoreScreenPopupItemBuyFail());
    }
  }
}
