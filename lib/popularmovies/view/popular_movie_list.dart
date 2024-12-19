import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/popularmovies/data/data_sourse/popular_api_data_sourse.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/popularmovies/view/popular_movie_item.dart';
import 'package:movies/recommendedmovies/data/model/results.dart';
import 'package:movies/shared/movie_details_arguments.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';

class PopularMovieList extends StatefulWidget {
  const PopularMovieList({super.key});

  @override
  State<PopularMovieList> createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  late Timer timer;
  List<ResultsforPopular> movies = [];
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPageIndex < movies.length - 1) {
        currentPageIndex++;
      } else {
        currentPageIndex = 0;
      }
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PopularApiDataSourse.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else {
          movies = snapshot.data?.results ?? [];
          return PageView.builder(
            controller: pageController,
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(MovieDetails.routeName,
                      arguments: MovieDetailsArguments(
                        moviesPopular: movies,
                        moviesRecommended: [],
                        moviesUpComing: [],
                        popularMovie: movies[index],
                        recommendedMovie: ResultsOfRecommended(),
                        upComingMovie: Results(), 
                      ));
                },
                child: PopularMovieItem(movie: movies[index])),
            itemCount: movies.length,
          );
        }
      },
    );
  }
}
