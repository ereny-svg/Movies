import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/shared/api_constant.dart';
import 'package:movies/upcomingmovies/data/model/upcoming_movie_response.dart';

class UpComingApiDataSourse {
  static Future<UpcomingMovieResponse> getUpcomingMovies() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1');
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.authorization,
      'accept': ApiConstant.accept
    });
    final json = jsonDecode(response.body);
    return UpcomingMovieResponse.fromJson(json);
  }
}
