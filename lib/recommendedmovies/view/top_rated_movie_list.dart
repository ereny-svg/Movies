import 'package:flutter/material.dart';
import 'package:movies/recommendedmovies/data/data_sourse/top_rated_api_data_sourse.dart';
import 'package:movies/recommendedmovies/view/top_rated_movie_item.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TopRatedApiDataSourse.getRecommendedMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator();
        } else {
          final movies = snapshot.data?.results ?? [];
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                  child: TopRatedMovieItem(movie: movies[index])),
              itemCount: movies.length,
            ),
          );
        }
      },
    );
  }
}
