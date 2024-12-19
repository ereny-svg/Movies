import 'package:flutter/material.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/recommendedmovies/data/data_sourse/top_rated_api_data_sourse.dart';
import 'package:movies/recommendedmovies/view/top_rated_movie_item.dart';
import 'package:movies/shared/movie_details_arguments.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TopRatedApiDataSourse.getRecommendedMovies(),
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
                        moviesRecommended: movies,
                        moviesUpComing: [],
                        popularMovie: ResultsforPopular(),
                        recommendedMovie: movies[index],
                        upComingMovie: Results(),
                      ));
                      },
                child: TopRatedMovieItem(movie: movies[index])),
            itemCount: movies.length,
          );
        }
      },
    );
  }
}
