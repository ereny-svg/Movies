import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/home/view/home_screen.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/tabs/home_screen_tab.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
              HomeScreenTab.routeName: (_) => const HomeScreenTab(),
              MovieDetails.routeName: (_) => const MovieDetails(),
            },
            initialRoute: HomeScreen.routeName,
            theme: AppTheme.darkTheme,
          );
        });
  }
}
