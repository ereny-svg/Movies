import 'package:movies/popularmovies/data/model/results.dart';

class PopularMovieResponse {
  int ?page;
  List<Results>? results;
  int ?totalPages;
  int? totalResults;

  PopularMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularMovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results =<Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

}