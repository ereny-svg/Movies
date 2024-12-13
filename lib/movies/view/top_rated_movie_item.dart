import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/view/movie_model.dart';
import 'package:movies/shared/triangle_clipper.dart';

class TopRatedMovieItem extends StatelessWidget {
  const TopRatedMovieItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 97.w,
          height: 186.h,
          decoration: BoxDecoration(
            color: AppTheme.neutralGray,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/images/${movie.posterImageName}.png',
                      width: 96.w,
                      height: 127.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: 27.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color: AppTheme.neutralGray.withOpacity(0.87),
                          borderRadius: const BorderRadiusDirectional.only(
                              topStart: Radius.circular(4),
                              topEnd: Radius.circular(4))),
                      child: Icon(
                        Icons.add,
                        color: AppTheme.white,
                        size: 17.sp,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(6.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         Icon(
                          Icons.star,
                          size: 15.sp,
                          color: AppTheme.darkYellow,
                        ),
                         SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          movie.vote,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 10.sp),
                        )
                      ],
                    ),
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 10.sp),
                    ),
                    Text(
                      DateTime.now().toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 8.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
         SizedBox(
          width: 14.w,
        )
      ],
    );
  }
}
