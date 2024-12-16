import 'package:flutter/material.dart';
import 'package:movies/movies/tabs/category/category_item.dart';
import 'package:movies/movies/tabs/category/category_model.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseScreenTab extends StatelessWidget {
  const BrowseScreenTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        toolbarHeight: 81.h,
        title: Container(
          padding: EdgeInsets.only(left: 8.w),
          height: 81.h,
          width: ScreenUtil().screenWidth,
          alignment: Alignment.bottomLeft,
          child: Text(
            'Browse Category ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38.w,
                    mainAxisSpacing: 40.h,
                    childAspectRatio: 2),
                itemBuilder: (_, index) => CategoryItem(
                  index: index,
                  categories: CategoryModel(
                      id: 'action', name: 'Action', imageName: 'yly'),
                ),
                itemCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
