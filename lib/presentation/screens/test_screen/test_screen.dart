import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/business_models/test_model.dart';
import '../../../view_model/test_screen_cubit/test_list_cubit.dart';
import 'widgets/test_item_widget.dart';

final List<TestItemWidget> testItems = [];
const LOG_TAG = "TestScreen";

class TestScreen extends StatelessWidget {
  final String bookTitle;

  TestScreen({Key? key, required this.bookTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle.toUpperCase()),
      ),
      body: BlocBuilder<TestListCubit, TestListState>(
        builder: (context, state) {
          if (state is TestListLoaded) {
            final testListInfo = state.testListModel;
            testItems.clear();
            for (TestModel testInfo in testListInfo) {
              testItems.add(TestItemWidget(
                testInfoModel: testInfo,
              ));
            }
            return _buildList();
          }
          return const Center(
            child: Text('Test Loading...'),
          );
        },
      ),
    );
  }

  Widget _buildList() {
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
