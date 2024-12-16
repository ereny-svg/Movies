import 'package:flutter/material.dart';
import 'package:movies/movies/tabs/category/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CategoryModel categories;

  const CategoryItem(
      {super.key, required this.index, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 158.w,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${categories.imageName}.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 90.h,
          ),
          Center(
            child: Text(
              categories.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
