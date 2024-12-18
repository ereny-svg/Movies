import 'package:flutter/material.dart';
import 'package:movies/movies/tabs/category/data/models/response.dart';
import 'package:movies/movies/tabs/category/view/widgets/category_filtered_movies_list.dart';
import 'package:movies/movies/tabs/category/view/widgets/category_item.dart';
import 'package:movies/movies/tabs/category/view/widgets/category_list.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilteredMovies extends StatelessWidget {
  static const String routeName = '/category';
  @override
  Widget build(BuildContext context) {
     var item = ModalRoute.of(context)!.settings.arguments as CategoryItem;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primary,
        toolbarHeight: 81.h,
        title: Container(
          padding: EdgeInsets.only(left: 8.w),
          height: 81.h,
          width: ScreenUtil().screenWidth,
          alignment: Alignment.bottomLeft,
          child: Text(
            item.categories.name??'',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CategoryFilteredMoviesLIST()
            ],
          ),
        ),
      ),
    );
  }
}
