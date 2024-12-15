import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/app_theme.dart';

class MovieType extends StatelessWidget {
  const MovieType({
    super.key,
    required this.typeName,
  });
  final String typeName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 65.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.dark2Gray,
         width: 2,
        ),
        borderRadius:const BorderRadius.all(Radius.circular(4))
      ),
      child: Center(
        child: Text(
          typeName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
