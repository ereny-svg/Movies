import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tabs/view/movie_model.dart';
import 'package:movies/tabs/view/triangle_clipper.dart';

class TopRatedMovieItem extends StatelessWidget {
  TopRatedMovieItem({super.key, required this.movie});
  MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 97,
          height: 186,
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
              Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: AppTheme.darkYellow,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          movie.vote,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 10),
                    ),
                    Text(
                      DateTime.now().toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 8),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 14,
        )
      ],
    );
  }
}
