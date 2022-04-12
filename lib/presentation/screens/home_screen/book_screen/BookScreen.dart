import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';
import 'package:flutter_toeic_quiz2/view_model/cubit/list_book_cubit.dart';

import 'widgets/book_item_widget.dart';

final List<BookItem> bookItems = [];

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final listBookCubit = ListBookCubit();
  bool listItemIsUpdated = false;


  @override
  void initState() {
    listBookCubit.getListBook();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBookCubit>(
      create: (context) => listBookCubit,
      child: Scaffold(
          appBar: AppBar(title: const Text('BOOKS'),),
          body: BlocConsumer<ListBookCubit, ListBookState>(
            listener: (context, state) {
              print("tandq BlockConsumer report: $state");
              if (state is ListBookLoaded) {
                final listBookInfor = state.listBook;
                bookItems.clear();
                for (BookInfor bookInfor in listBookInfor) {
                  bookItems.add(BookItem(
                      toeicBook: BookInfor(
                          author: bookInfor.author,
                          coverUrl: bookInfor.coverUrl,
                          des: bookInfor.des,
                          id: bookInfor.id,
                          price: bookInfor.price,
                          title: bookInfor.title)));
                }
              }
            },
            builder: (context, state) {
              if (state is ListBookLoaded) return _buildList();
              return Center(
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
