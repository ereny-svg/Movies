import 'package:flutter/material.dart';
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
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator();
        } else {
          final movies = snapshot.data?.results ?? [];
          return Expanded(
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                    child: UpcomingMovieItem(movie:movies[index])),
                itemCount: movies.length,
              ),
            ),
          );
        }
      },
    );
  }
}