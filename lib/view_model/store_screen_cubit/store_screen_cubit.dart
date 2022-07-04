import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_providers/dtos/book_dto.dart';
import '../../domain/get_book_detail_use_case/get_list_book_use_case.dart';
import '../../domain/get_from_network_use_case/get_store_item_list_use_case.dart';

part 'store_screen_state.dart';

const _logTag = "StoreScreenCubit";

class StoreScreenCubit extends Cubit<StoreScreenState> {
  StoreScreenCubit() : super(StoreScreenInitial());
  final _getFromStoreBookListUseCase = GetIt.I.get<GetStoreItemListUseCase>();
  final _getBookListUserCase = GetIt.I.get<GetListBookUseCase>();

  Future<void> getInitContent() async {
    emit(StoreScreenBooksLoading());
    final storeBookInfoList = await _getFromStoreBookListUseCase.perform();

    // final dbBookList = await _getBookListUserCase.perform();
    // for (BookDto storeBook in storeBookInfoList) {
    //   log('$_logTag storeBookInfoModel: ${storeBook.id}');
    //   for (BookModel bookInfoModel in dbBookList) {
    //     log('$_logTag db bookInfoModel: ${bookInfoModel.id}');
    //     if (storeBook.id == bookInfoModel.id) {
    //       storeBook.isBought = true;
    //       log('$_logTag bought: ${storeBook.id}');
    //       break;
    //     }
    //   }
    // }

    emit(StoreScreenBooksLoaded(bookDto: storeBookInfoList));
  }
}
