import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';

import '../../data/business_models/book_info_model.dart';
import '../../data/data_providers/network_response_models/book_network_object.dart';
import '../../domain/get_from_db_use_case/get_list_book_use_case.dart';
import '../../domain/get_from_network_use_case/get_store_item_list_use_case.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'store_screen_state.dart';

const LOG_TAG = "StoreScreenCubit";

class StoreScreenCubit extends Cubit<StoreScreenState> {
  StoreScreenCubit() : super(StoreScreenInitial());
  final GetStoreItemListUseCase _getFromStoreBookListUseCase =
      GetStoreItemListUseCase();
  final GetListBookUseCase _getFromDBBookListUserCase = GetListBookUseCase();

  Future<void> getInitContent() async {
    emit(StoreScreenBooksLoading());
    final storeBookInfoList = await _getFromStoreBookListUseCase.perform(() {});

    // final dbBookInforList = await _getFromDBBookListUserCase.getListInfo();
    // for (BookNetworkObject storeBookInfoObject in storeBookInfoList) {
    //   log('$LOG_TAG storeBookInfoModel: ${storeBookInfoObject.id}');
    //   for (BookInfoModel bookInfoModel in dbBookInforList) {
    //     log('$LOG_TAG db bookInfoModel: ${bookInfoModel.id}');
    //     if (storeBookInfoObject.id == bookInfoModel.id) {
    //       storeBookInfoObject.isBought = true;
    //       log('$LOG_TAG bought: ${storeBookInfoObject.id}');
    //       break;
    //     }
    //   }
    // }
    // check item bought

    emit(StoreScreenBooksLoaded(networkStoreItemModelList: storeBookInfoList));
  }
}
