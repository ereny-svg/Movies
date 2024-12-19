import 'package:flutter/material.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/recommendedmovies/data/model/results.dart';
import 'package:movies/shared/movie_details_arguments.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/upcomingmovies/data/data_source/up_coming_api_data_sourse.dart';
import 'package:movies/upcomingmovies/view/upcoming_movie_item.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UpComingApiDataSourse.getUpcomingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else {
          final movies = snapshot.data?.results ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                  Navigator.of(context).pushNamed(MovieDetails.routeName,
                      arguments: MovieDetailsArguments(
                        moviesPopular: [],
                        moviesRecommended: [],
                        moviesUpComing: movies,
                        popularMovie: ResultsforPopular(),
                        recommendedMovie: ResultsOfRecommended(),
                        upComingMovie: movies[index], 
                      ));
                      },
                child: UpcomingMovieItem(movie:movies[index])),
            itemCount: movies.length,
          );
        }
      }, 
    );
  }
}