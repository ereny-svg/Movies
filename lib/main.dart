import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/home/view/home_screen.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/movies/tabs/category/view/screens/category_filtered_movies.dart';
import 'package:movies/shared/app_theme.dart';

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
              MovieDetails.routeName: (_) => const MovieDetails(),
              CategoryFilteredMovies.routeName:(_)=> CategoryFilteredMovies()
            },
            initialRoute: HomeScreen.routeName,
            theme: AppTheme.darkTheme,
          );
        });
  }
}
