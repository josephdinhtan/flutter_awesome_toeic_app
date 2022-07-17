import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

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
      body: BlocConsumer<TestListCubit, TestListState>(
        listener: (context, state) {
          if (state is TestListLoaded) {
            final testListInfo = state.testListModel;
            testItems.clear();
            for (TestModel testInfo in testListInfo) {
              testItems.add(TestItemWidget(
                testModel: testInfo,
              ));
            }
          }
        },
        builder: (context, state) {
          if (state is TestListLoaded) {
            return _buildList();
          }
          if (state is TestListLoading) {
            return const Center(
              child: Text('Test Loading...'),
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
      itemCount: (testItems.length + 1) + 3,
      separatorBuilder: (context, index) {
        return SizedBox(height: 4.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) return SizedBox(height: 4.h);
        return testItems[0];
      },
    );
  }
}
