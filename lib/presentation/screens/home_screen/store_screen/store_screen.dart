import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/fire_base_api/firebase_books_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/book_repository/book_repository.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/store_screen/widgets/book_store_item_widget.dart';
import 'package:flutter_toeic_quiz2/view_model/store_screen_cubit/store_screen_cubit.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../data/repositories/book_repository/book_repository_impl.dart';
import '../../../../domain/get_store_item_list_use_case.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late Future<String> dataFileItemList;

  @override
  void initState() {
    super.initState();
    //dataFileItemList = FirebaseApi.getMainFileItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STORE',
        ),
      ),
      body: _buildList('test'),
    );
  }

  Widget _buildList(String jsonString) {
    //List<dynamic> json = jsonDecode(jsonString);
    //bookInfos.sort((a, b) => a['id'].compareTo(b['id']));

    // test only, this shoud in cubit viewmodel, need remove
    //GetStoreItemListUseCase useCase = GetStoreItemListUseCase();
    //List<BookInfoModel> bookInfoModelList = await useCase.getListInfo();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider<StoreScreenCubit>(
      create: (context) => StoreScreenCubit()..getBookListFromNetwork(),
      child: Center(
        child: SizedBox(
          width: width > AppDimensions.maxWidthForMobileMode
              ? AppDimensions.maxWidthForMobileMode
              : null,
          child: BlocBuilder<StoreScreenCubit, StoreScreenState>(
            builder: (context, state) {
              if (state is StoreScreenBooksLoaded) {
                List<BookInfoModel> bookInfoModelList = state.bookInfoModelList;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MasonryGridView.count(
                    itemCount: bookInfoModelList.length + 2,
                    crossAxisCount: width > AppDimensions.maxWidthForMobileMode
                        ? 3
                        : 2,
                    itemBuilder: (context, index) {
                      // return BookStoreItemWidget(
                      //   toeicBook: toeicBook,
                      // );
                      index = 0;
                      return BookStoreItemWidget(
                        toeicBook: bookInfoModelList[index],
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text('Loading...'));
              }
            },
          ),
        ),
      ),
    );
  }
}
