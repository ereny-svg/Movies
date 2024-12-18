import 'package:movies/movies/tabs/category/data/models/results.dart';

class CategoryNameResponse {
  List<Results>? results;

  CategoryNameResponse({this.results});

  CategoryNameResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      results = <Results>[];
      json['genres'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['genres'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}