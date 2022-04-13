import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/test_info_model.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/widgets/test_item_widget.dart';
import 'package:flutter_toeic_quiz2/view_model/test_screen_cubit/test_list_cubit.dart';

final List<TestItemWidget> testItems = [];
final testListCubit = TestListCubit();

class TestScreen extends StatefulWidget {
  final int bookId;
  final String bookTitle;

  TestScreen({Key? key, required this.bookId, required this.bookTitle})
      : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    testListCubit.getListTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestListCubit>(
      create: (context) => testListCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ETS 2020'.toUpperCase()),
        ),
        body: BlocConsumer<TestListCubit, TestListState>(
          listener: (context, state) {
            if (state is TestListLoaded) {
              final testListInfo = state.testListModel;
              testItems.clear();
              for (TestInfoModel testInfo in testListInfo) {
                testItems.add(TestItemWidget.fromTestInfoModel(testInfo,));
              }
            }
          },
          builder: (context, state) {
            print('test_list_cubit ==Inbuilder== $state');
            if (state is TestListLoaded) return _buildList();
            return const Center(
              child: Text('Test Loading...'),
            );
          },
        ),
      ),
    );
  }

  Column _buildList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: index == testItems.length - 1 ? 8.0 : 0.0,
                    top: index == 0 ? 8.0 : 0.0),
                child: testItems[index],
              );
            },
            itemCount: testItems.length,
          ),
        ),
      ],
    );
  }
}
