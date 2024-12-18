

import 'package:movies/recommendedmovies/data/model/results.dart';

class RecommendedMovieResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int ?totalResults;

  RecommendedMovieResponse({this.page, this.results, this.totalPages, this.totalResults});

  RecommendedMovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

}
