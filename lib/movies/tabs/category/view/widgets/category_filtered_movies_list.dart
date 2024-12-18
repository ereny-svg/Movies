import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/tabs/category/data/category_data_source/category_filtered_APi.dart';
import 'package:movies/movies/tabs/category/view/widgets/category_movies_filtered_item.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
class CategoryFilteredMoviesLIST extends StatelessWidget{
  const CategoryFilteredMoviesLIST();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryFilterdAPI.getCategoryFilterd(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator();
        } else {
          final categoryList = snapshot.data?.results ?? [];
          return 
          Expanded(
            
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                 itemBuilder: (_, index) =>  CategoryFilteredMoviesFilteredItem(categoryList[index]),
                itemCount: categoryList.length,
              ),
            );
        }
      },
    );
  }
}