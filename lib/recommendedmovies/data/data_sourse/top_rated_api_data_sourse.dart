import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/recommendedmovies/data/model/recommended_movie_response.dart';
import 'package:movies/shared/api_constant.dart';

class TopRatedApiDataSourse {
  static Future<RecommendedMovieResponse> getRecommendedMovies() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.authorization,
      'accept': ApiConstant.accept
    });
    final json = jsonDecode(response.body);
    return RecommendedMovieResponse.fromJson(json);
  }
}
