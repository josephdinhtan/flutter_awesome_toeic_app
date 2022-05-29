import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/store_screen/widgets/book_store_item_widget.dart';
import 'package:flutter_toeic_quiz2/view_model/book_screen_cubit/book_list_cubit.dart';
import 'package:flutter_toeic_quiz2/view_model/store_screen_cubit/store_screen_cubit.dart';

import '../../../../core/constants/app_dimensions.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STORE',
        ),
      ),
      body: _buildList('test', context),
    );
  }

  Widget _buildList(String jsonString, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: width > AppDimensions.maxWidthForMobileMode
            ? AppDimensions.maxWidthForMobileMode
            : null,
        child: BlocBuilder<StoreScreenCubit, StoreScreenState>(
          builder: (context, state) {
            if (state is StoreScreenBooksLoading) {
              return const Center(child: Text('Loading...'));
            }
            if (state is StoreScreenBooksLoaded) {
              List<BookInfoModel> bookInfoModelList = state.bookInfoModelList;
              if (bookInfoModelList.isEmpty) {
                return const Center(
                    child: Text('Loading done, but no item found...'));
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  itemCount: bookInfoModelList.length,
                  // extern for display purpose, shoudl remove 4
                  crossAxisCount:
                      width > AppDimensions.maxWidthForMobileMode ? 3 : 2,
                  itemBuilder: (context, index) {
                    // return BookStoreItemWidget(
                    //   toeicBook: toeicBook,
                    // );
                    //index = 0;
                    return BlocProvider.value(
                      value: BlocProvider.of<StoreScreenCubit>(context),
                      child: BookStoreItemWidget(
                        bookInfoModel: bookInfoModelList[index],
                        isBought: bookInfoModelList[index].isBought,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text('unknow state ${state}'));
            }
          },
        ),
      ),
    );
  }
}
