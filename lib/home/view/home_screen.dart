import 'package:flutter/material.dart';
import 'package:movies/movies/tabs/browse_screen_tab.dart';
import 'package:movies/movies/tabs/home_screen_tab.dart';
import 'package:movies/movies/tabs/search_screen_tab.dart';
import 'package:movies/movies/tabs/watch_list_screen_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void selectedScreen(int index) {
    selectedIndex = index;
    setState(() {});
  }

  List<Widget> screens = [
    const HomeScreenTab(),
    const SearchScreenTab(),
    const BrowseScreenTab(),
    const WatchListScreenTab(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedScreen,
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'BROWSE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'WATCHLIST',
            ),
          ]),
    );
  }
}
