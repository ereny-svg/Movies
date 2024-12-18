import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/tabs/category/data/models/results.dart';

class CategoryItem extends StatelessWidget {
  final Results categories;

  const CategoryItem(
      {super.key,required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 158.w,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/backimage.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 90.h,
          ),
          Center(
            child: Text(
              categories.name??'',
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
