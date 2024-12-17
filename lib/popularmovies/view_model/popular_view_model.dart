import 'package:flutter/material.dart';
import 'package:movies/popularmovies/data/data_sourse/popular_api_data_sourse.dart';
import 'package:movies/popularmovies/data/model/results.dart';

class PopularViewModel with ChangeNotifier{
  final dataSourse=PopularApiDataSourse();

  List<Results>movies=[];
  bool isLoading=false;
  String? errorMessage;
  Future<void> getPopularMovie()async{
    isLoading=true;
    notifyListeners();
    try{
       movies=await dataSourse.getPopularMovie();
    }catch(error){
        errorMessage=error.toString(); 
    }
   isLoading=false;
   notifyListeners();
  }
}