import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/favorite_screen/favorite_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/setting_screen/setting_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/store_screen/store_screen.dart';

import 'book_screen/BookScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _bookScreen;
  late Widget _storeScreen;
  late Widget _favoriteScreen;
  late Widget _moreScreen;
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // init screen
    _bookScreen = const BookScreen();
    _storeScreen = const StoreScreen();
    _favoriteScreen = const FavoriteScreen();
    _moreScreen = SettingScreen();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _selectedIndex = 0;
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          children: <Widget>[
            _bookScreen,
            _storeScreen,
            _favoriteScreen,
            _moreScreen,
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
