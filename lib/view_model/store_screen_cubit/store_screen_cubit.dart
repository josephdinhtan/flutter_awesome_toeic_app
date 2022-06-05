import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/store_api/network_store_item_object.dart';
import 'package:flutter_toeic_quiz2/domain/save_to_db_use_cases/save_book_to_db_use_case.dart';
import 'package:meta/meta.dart';

import '../../data/business_models/book_info_model.dart';
import '../../data/business_models/test_info_model.dart';
import '../../data/data_providers/apis/book_api.dart';
import '../../data/data_source/daos/book_dao.dart';
import '../../data/repositories/book_repository/book_repository_impl.dart';
import '../../domain/get_from_db_use_case/get_list_book_use_case.dart';
import '../../domain/get_from_network_use_case/get_store_item_list_use_case.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'store_screen_state.dart';

final LOG_TAG = "StoreScreenCubit";

class StoreScreenCubit extends Cubit<StoreScreenState> {
  StoreScreenCubit() : super(StoreScreenInitial());
  GetStoreItemListUseCase _getFromStoreBookListUseCase =
      GetStoreItemListUseCase();
  GetListBookUseCase _getFromDBBookListUserCase = GetListBookUseCase();

  Future<void> getInitContent() async {
    emit(StoreScreenBooksLoading());
    final storeBookInfoList = await _getFromStoreBookListUseCase.getListInfo();
    log("$LOG_TAG getBookListFromNetwork() loaded: $storeBookInfoList");

    final dbBookInforList = await _getFromDBBookListUserCase.getListInfo();
    for (NetworkStoreItemModel storeBookInfoModel in storeBookInfoList) {
      log('$LOG_TAG storeBookInfoModel: ${storeBookInfoModel.getBoxId()}');
      for (BookInfoModel bookInfoModel in dbBookInforList) {
        log('$LOG_TAG db bookInfoModel: ${bookInfoModel.getBoxId()}');
        if (storeBookInfoModel.getBoxId() == bookInfoModel.getBoxId()) {
          storeBookInfoModel.isBought = true;
          log('$LOG_TAG bought: ${storeBookInfoModel.getBoxId()}');
          break;
        }
      }
    }
    //check item bought

    emit(StoreScreenBooksLoaded(
        networkStoreItemModelList: storeBookInfoList));
  }
}
