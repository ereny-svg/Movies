import 'package:movies/search/data/models/resultss.dart';

class SearchResponse {
  int? page;
  List<Resultss>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({this.page, this.results, this.totalPages, this.totalResults});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Resultss>[];
      json['results'].forEach((v) {
        results!.add(new Resultss.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  
}