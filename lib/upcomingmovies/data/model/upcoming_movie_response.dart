import 'package:movies/upcomingmovies/data/model/date.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';

class UpcomingMovieResponse {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  UpcomingMovieResponse(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  UpcomingMovieResponse.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
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