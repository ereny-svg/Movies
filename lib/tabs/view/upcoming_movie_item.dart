import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tabs/view/movie_model.dart';
import 'package:movies/tabs/view/triangle_clipper.dart';

class UpcomingMovieItem extends StatelessWidget {
   UpcomingMovieItem({super.key,required this.movie});
MovieModel movie;
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
                width: 96,
                height: 127,
                fit: BoxFit.fill,
              ),
            ),
            ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: 27,
                height: 36,
                decoration: BoxDecoration(
                    color: AppTheme.neutralGray.withOpacity(0.87),
                    borderRadius:const BorderRadiusDirectional.only(
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
          width: 13,
        )
      ],
    );
  }
}
