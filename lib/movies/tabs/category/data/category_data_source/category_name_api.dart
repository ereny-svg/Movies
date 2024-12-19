import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/movies/tabs/category/data/models/category_name_response.dart';

class CategoryNameAP {
  static Future getCategoryName () async {
    final uri = Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en');
    final response = await http.get(uri,headers: {
      'Authorization' : 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDIyMzE2YjdlZjBlYTQ2OTE5ZGJhZTdiMTlhMzFlMCIsIm5iZiI6MTczMzgxOTYxMC42NjUsInN1YiI6IjY3NTdmY2RhODEzOGJlNTVkOWExM2Y4MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UBMuK9xGrGBoZMtudah3TSRxuyqj2qbuts_lvGcXkAg',
    });
    final json = jsonDecode(response.body);
    return CategoryNameResponse.fromJson(json);
  }
}


