import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/tabs/category/data/category_data_source/category_name_api.dart';
import 'package:movies/movies/tabs/category/view/screens/category_filtered_movies.dart';
import 'package:movies/movies/tabs/category/view/widgets/category_item.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class categoryList extends StatelessWidget {
  const categoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryNameAP.getCategoryName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator();
        } else {
          final categoryList = snapshot.data?.results ?? [];
          return 
          Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38.w,
                    mainAxisSpacing: 47.h,
                    childAspectRatio: 2),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                CategoryFilteredMovies.routeName,
                arguments: CategoryItem(categories: categoryList[index]),
                ),
                  child: CategoryItem(categories: categoryList[index]),
                ),
                itemCount: categoryList.length,
              ),
            );
        }
      },
    );
  }
}
