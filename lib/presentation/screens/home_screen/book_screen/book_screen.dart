import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

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
        title: Text('Home'.toUpperCase()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.store);
              }, //Icons.shopping_cart_outlined
              icon: SizedBox(
                  width: 50.w,
                  child: const Icon(Icons.file_download_outlined))),
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
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: (bookItems.length),
      separatorBuilder: (context, index) {
        return SizedBox(height: 4.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: bookItems[index],
              ),
            ],
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: bookItems[index],
            ),
            if (index == bookItems.length) SizedBox(height: 12.h),
          ],
        );
      },
    );
  }
}
