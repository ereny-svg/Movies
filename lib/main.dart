import 'package:flutter/material.dart';
import 'package:movies/home/view/home_screen.dart';

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
      HomeScreen.routeName : (_) => HomeScreen(),
    },
      initialRoute: HomeScreen.routeName,
    );
  }
}
