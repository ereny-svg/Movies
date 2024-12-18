import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/movies/tabs/category/data/models/category_filtered_response.dart';

class CategoryFilterdAPI {
  static Future <CategoryFilteredResponse> getCategoryFilterd () async {
    final uri = Uri.parse('https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
    final response = await http.get(uri,headers: {
      'Authorization' : 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDIyMzE2YjdlZjBlYTQ2OTE5ZGJhZTdiMTlhMzFlMCIsIm5iZiI6MTczMzgxOTYxMC42NjUsInN1YiI6IjY3NTdmY2RhODEzOGJlNTVkOWExM2Y4MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UBMuK9xGrGBoZMtudah3TSRxuyqj2qbuts_lvGcXkAg',
    });
    final json = jsonDecode(response.body);
    return CategoryFilteredResponse.fromJson(json);
  }
}


