import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_colors.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/book_screen/BookScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          children: const <Widget>[
            BookScreen(),
            BookScreen(),
            BookScreen(),
            BookScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Books',
            icon: Icon(Icons.my_library_books_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Store',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.storage_rounded),
          ),
        ],
      ),
    );
  }
}
