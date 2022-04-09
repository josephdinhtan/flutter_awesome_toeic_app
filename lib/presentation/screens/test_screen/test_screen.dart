import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';

class TestScreen extends StatelessWidget {
  final int bookId;
  final String bookTitle;
  const TestScreen({Key? key, required this.bookId, required this.bookTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Test web screen'),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.home),
              child: Text('Go to home page')),
        ],
      ),
    );
  }
}
