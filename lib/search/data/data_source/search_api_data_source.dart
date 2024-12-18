import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/search/data/models/search_response.dart';

class SearchApiDataSource {
  static Future<SearchResponse> SearchMovies (String query) async {
    final uri = Uri.parse('https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1&query=$query');
    final response = await http.get(uri,headers: {
      'Authorization' : 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDIyMzE2YjdlZjBlYTQ2OTE5ZGJhZTdiMTlhMzFlMCIsIm5iZiI6MTczMzgxOTYxMC42NjUsInN1YiI6IjY3NTdmY2RhODEzOGJlNTVkOWExM2Y4MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UBMuK9xGrGBoZMtudah3TSRxuyqj2qbuts_lvGcXkAg',
    });
    final json = jsonDecode(response.body);
    return SearchResponse.fromJson(json);

  }
}