
import 'package:movies/movies/tabs/category/data/models/response.dart';

class CategoryFilteredResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  CategoryFilteredResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  CategoryFilteredResponse.fromJson(Map<String, dynamic> json) {
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