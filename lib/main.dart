import 'package:flutter/material.dart';
import 'package:movies/home/view/home_screen.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tabs/view/home_screen_tab.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowMaterialGrid: false,debugShowCheckedModeBanner: false,
    routes: {
      HomeScreen.routeName : (_) => const HomeScreen(),
      HomeScreenTab.routeName : (_) => const HomeScreenTab(),
    },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.darkTheme,
    );
  }
}
