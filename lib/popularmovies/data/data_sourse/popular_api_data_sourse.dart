import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/popularmovies/data/model/popular_movie_response.dart';
import 'package:movies/shared/api_constant.dart';

class PopularApiDataSourse {
  static Future<PopularMovieResponse> getPopularMovies() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.authorization,
      'accept': ApiConstant.accept
    });
    final json = jsonDecode(response.body);
    return PopularMovieResponse.fromJson(json);
  }
}

