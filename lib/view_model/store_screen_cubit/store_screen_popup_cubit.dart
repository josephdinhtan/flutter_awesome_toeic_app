import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/book_dto.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';
import 'package:flutter_toeic_quiz2/domain/download_use_case/download_book_cover_use_case.dart';

import '../../domain/save_to_db_use_cases/save_book_to_db_use_case.dart';

part 'store_screen_popup_state.dart';

const logTag = "StoreScreenPopupCubit";

class StoreScreenPopupCubit extends Cubit<StoreScreenPopupState> {
  StoreScreenPopupCubit() : super(StoreScreenPopupInitial());
  final BaseUseCase _saveABookUseCase = SaveBookToDbUseCase();
  final DownloadBookCoverUseCase _downloadBookCoverUseCase =
      DownloadBookCoverUseCase();

  Future<void> displayBookItemPopup() async {
    emit(StoreScreenPopupItemDisplay());
  }

  Future<void> buyABookItem(BookDto bookDto) async {
    emit(StoreScreenPopupItemBuying());
    bool saveOk = false;
    if (kIsWeb) {
      // save to firebase
      await Future.delayed(const Duration(milliseconds: 1000));
      saveOk = false;
    } else {
      final downloadOK =
          await _downloadBookCoverUseCase.perform(bookDto.cover_url);
      if (LogEnable) {
        log("$logTag buyABookItem() download bookCover done downloadOK: $downloadOK");
      }
      if (!downloadOK) {
        emit(StoreScreenPopupItemBuyFail());
        return;
      }
      saveOk = await _saveABookUseCase.perform(bookDto);
      if (LogEnable) {
        log("$logTag buyABookItem() download save a book done saveOk: $saveOk");
      }
    }
    if (saveOk) {
      emit(StoreScreenPopupItemBought());
    } else {
      emit(StoreScreenPopupItemBuyFail());
    }
  }
}
