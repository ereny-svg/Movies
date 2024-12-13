import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/view/movie_model.dart';
import 'package:movies/shared/triangle_clipper.dart';

class UpcomingMovieItem extends StatelessWidget {
  const UpcomingMovieItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/images/${movie.posterImageName}.png',
                width: 96.87.w,
                height: 127.74.h,
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
                child: const Icon(
                  Icons.add,
                  color: AppTheme.white,
                  size: 17,
                ),
              ),
            )
          ],
        ),
         SizedBox(
          width: 13.w,
        )
      ],
    );
  }
}
