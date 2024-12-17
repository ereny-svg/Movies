import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/view/movie_model.dart';
import 'package:movies/shared/triangle_clipper.dart';

class PopularMovieItem extends StatelessWidget {
  const PopularMovieItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 28),
      width: 412.w,
      height: 289.h,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/${movie.backImageName}.png',
                width: 412.w,
                height: 217.h,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: 79.h, left: 176.w),
                child: Icon(
                  Icons.play_circle_fill_outlined,
                  size: 70.sp,
                  color: AppTheme.white,
                ),
              ),
              Container(
                margin:  EdgeInsets.only(top: 231.h, left: 164.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      DateTime.now().toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 90.h, left: 21.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/${movie.posterImageName}.png',
                        width: 129.w,
                        height: 199.h,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
