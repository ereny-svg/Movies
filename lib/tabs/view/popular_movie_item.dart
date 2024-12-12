import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tabs/view/movie_model.dart';
import 'package:movies/tabs/view/triangle_clipper.dart';

class PopularMovieItem extends StatelessWidget {
  PopularMovieItem({super.key, required this.movie});
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 28),
      width: 412,
      height: 289,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/${movie.backImageName}.png',
                width: 412,
                height: 217,
                fit: BoxFit.fill,
              ),
              Container(
                margin: const EdgeInsets.only(top: 79, left: 176),
                child: const Icon(
                  Icons.play_circle_fill_outlined,
                  size: 70,
                  color: AppTheme.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 231, left: 164),
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
                margin: const EdgeInsets.only(top: 90, left: 21),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/${movie.posterImageName}.png',
                        width: 129,
                        height: 199,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
