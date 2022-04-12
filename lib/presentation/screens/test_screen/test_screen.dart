import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/widgets/test_item.dart';

class TestScreen extends StatelessWidget {
  final int bookId;
  final String bookTitle;

  const TestScreen({Key? key, required this.bookId, required this.bookTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TestItem> testItems = [];
    testItems.add(TestItem(testBoxId: '1', title: "Practice Test 1", resourceUrl: 'demo', questionNumber: 200, ));
    testItems.add(TestItem(testBoxId: '2', title: "Practice Test 2", resourceUrl: 'demo', questionNumber: 200, dowloaded: true, onProgress: true,));
    testItems.add(TestItem(testBoxId: '3', title: "Practice Test 3", resourceUrl: 'demo', questionNumber: 200, actualScore: 880, dowloaded: true, onProgress: true,));
    return Scaffold(
      appBar: AppBar(
        title: Text('ETS 2020'),
      ),
      body: Column(
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
      ),
    );
  }
}
