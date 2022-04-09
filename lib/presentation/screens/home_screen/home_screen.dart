import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/dimensions.dart';
import 'package:flutter_toeic_quiz2/data/dataproviders/book_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';
import 'package:flutter_toeic_quiz2/domain/get_list_book_use_case.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/widgets/book_item_widget.dart';
import 'package:flutter_toeic_quiz2/view_model/cubit/list_book_cubit.dart';

import '../../../data/repositories/book_repository.dart';

final List<BookItem> bookItems = [];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listBookCubit = ListBookCubit();
  bool listItemIsUpdated = false;
  @override
  void initState() {
    super.initState();
    listBookCubit.getListBook();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBookCubit>(
      create: (context) => listBookCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BOOKS',
          ),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<ListBookCubit>(context).getListBook();
                  },
                  icon: Icon(Icons.replay_outlined));
            }),
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => StoreScreen(),
                  //   ),
                  // );
                },
                icon: Icon(Icons.shopping_cart_outlined)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined)),
            SizedBox(
              width: Dimensions.kPaddingDefault,
            )
          ],
        ),
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
            left: Dimensions.kPaddingDefault,
            right: Dimensions.kPaddingDefault,
            top: index == 0 ? Dimensions.kPaddingDefault / 2 : 0.0,
            bottom: index == bookItems.length - 1
                ? Dimensions.kPaddingDefault / 2
                : 0.0,
          ),
          child: bookItems[index],
        );
      },
    );
  }
}
