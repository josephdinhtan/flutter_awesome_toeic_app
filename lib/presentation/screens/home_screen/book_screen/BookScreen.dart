import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/view_model/book_screen_cubit/book_list_cubit.dart';

import 'widgets/book_item_widget.dart';

final List<BookItemWidget> bookItems = [];
final bookListCubit = BookListCubit();

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool listItemIsUpdated = false;


  @override
  void initState() {
      bookListCubit.getListBook();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookListCubit>(
      create: (context) => bookListCubit,
      child: Scaffold(
          appBar: AppBar(title: Text('BOOKS'.toUpperCase()),),
          body: BlocConsumer<BookListCubit, BookListState>(
            listener: (context, state) {
              if (state is BookListLoaded) {
                final bookListInfor = state.bookListModel;
                bookItems.clear();
                for (BookInfoModel bookInfor in bookListInfor) {
                  bookItems.add(BookItemWidget(
                      toeicBook: bookInfor));
                }
              }
            },
            builder: (context, state) {
              if (state is BookListLoaded) return _buildList();
              return const Center(
                child: Text('Loading...'),
              );
            },
          ),
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
