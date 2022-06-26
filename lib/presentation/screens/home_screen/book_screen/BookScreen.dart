import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../data/business_models/book_model.dart';
import '../../../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../../router/app_router.dart';
import 'widgets/book_item_widget.dart';

final List<BookItemWidget> bookItems = [];

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOOKS'.toUpperCase()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.store);
              }, //Icons.shopping_cart_outlined
              icon: const Icon(CupertinoIcons.cart_badge_plus)),
        ],
      ),
      body: BlocConsumer<BookListCubit, BookListState>(
        listener: (context, state) {
          if (state is BookListLoaded) {
            final bookListInfo = state.bookListModel;
            bookItems.clear();
            for (BookModel bookInfo in bookListInfo) {
              bookItems.add(BookItemWidget(bookInfoModel: bookInfo));
            }
          }
        },
        builder: (context, state) {
          if (state is BookListInitial) {
            return const Center(
              child: Text('Still in init state'),
            );
          }
          if (state is BookListLoaded) return _buildList();
          if (state is BookListLoading) {
            return const Center(
              child: Text('Loading...'),
            );
          }
          return const Center(
            child: Text('Loaded but no item found.'),
          );
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: bookItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.kPaddingDefault,
            right: AppDimensions.kPaddingDefault,
            top: index == 0 ? AppDimensions.kPaddingDefault / 2 : 0.0,
            bottom: index == bookItems.length - 1
                ? AppDimensions.kPaddingDefault / 2
                : 0.0,
          ),
          child: bookItems[index],
        );
      },
    );
  }
}
