import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/popularmovies/data/model/popular_movie_response.dart';
import 'package:movies/popularmovies/data/model/results.dart';

import 'package:movies/shared/api_constant.dart';

class PopularApiDataSourse {
  Future<List<Results>> getPopularMovie() async {
    try {
      final url = Uri.https(ApiConstant.baseUrl, ApiConstant.popularEndpoint, {
        'apiKey': ApiConstant.apiKey,
      });
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final popularResponse = PopularMovieResponse.fromJson(json);
        return popularResponse.results ?? [];
      } else {
        throw Exception('failed to get popular movies');
      }
    } catch (error) {
      throw Exception('failed to get popular movies');
    }
  }
}
