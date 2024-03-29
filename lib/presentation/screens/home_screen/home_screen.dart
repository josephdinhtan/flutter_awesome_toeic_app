import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import '../../../core_utils/global_configuration.dart';
import '../../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../../view_model/favorite_screen_cubit/cubit/favorite_screen_cubit.dart';
import '../../../view_model/settings_screen_cubit/settings_screen_cubit.dart';
import 'book_screen/book_screen.dart';
import 'favorite_screen/favorite_screen.dart';
import 'setting_screen/setting_screen.dart';

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Playlists',
    icon: Icon(Icons.playlist_add_check),
    route: '/playlists',
  ),
  NavigationDestination(
    label: 'Artists',
    icon: Icon(Icons.people),
    route: '/artists',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _bookScreen;
  late Widget _favoriteScreen;
  late Widget _moreScreen;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookListCubit>(context).getBookList();
    _bookScreen = BlocProvider.value(
      value: BlocProvider.of<BookListCubit>(context),
      child: const BookScreen(),
    );
    _favoriteScreen = BlocProvider.value(
      value: BlocProvider.of<FavoriteScreenCubit>(context),
      child: const FavoriteScreen(),
    );
    _moreScreen = BlocProvider.value(
      value: BlocProvider.of<SettingsScreenCubit>(context),
      child: SettingScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    int _selectedIndex = 0;
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          children: <Widget>[
            _bookScreen,
            _favoriteScreen,
            _moreScreen,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        backgroundColor:
            context.colors.surfaceVariant.withOpacity(surfaceVariantOpacity),
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(CupertinoIcons.square_favorites_alt),
            activeIcon: Icon(CupertinoIcons.square_favorites_alt_fill),
          ),
          BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(CupertinoIcons.settings),
              activeIcon: Icon(CupertinoIcons.settings)),
        ],
      ),
    );
  }
}
