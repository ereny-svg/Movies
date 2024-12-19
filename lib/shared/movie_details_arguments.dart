import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/recommendedmovies/data/model/results.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';

class MovieDetailsArguments {
  ResultsOfRecommended recommendedMovie;
  ResultsforPopular popularMovie;
  Results upComingMovie;
  final List<ResultsOfRecommended> moviesRecommended;
  final List<ResultsforPopular> moviesPopular;
  final List<Results> moviesUpComing;

  MovieDetailsArguments({
    required this.recommendedMovie,
    required this.popularMovie,
    required this.upComingMovie,
    required this.moviesRecommended,
    required this.moviesPopular,
    required this.moviesUpComing,
  });
}
