import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/view/movie_model.dart';
import 'package:movies/movies/view/popular_movie_item.dart';
import 'package:movies/movies/view/top_rated_movie_item.dart';
import 'package:movies/movies/view/upcoming_movie_item.dart';

class HomeScreenTab extends StatelessWidget {
  static const String routeName = '/home_tab';
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    final movies_new_releases = List.generate(
      6,
      (index) => MovieModel(
          id: '${index + 1}',
          title: 'Dora and the lost city of gold',
          overview:
              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
          backImageName: 'backimage',
          posterImageName: 'posterimage',
          vote: '7.7',
          date: DateTime.now()),
    );
    final movies_recommended = List.generate(
      6,
      (index) => MovieModel(
          id: '${index + 1}',
          title: 'DeadPool',
          overview:
              'oul-mouthed mutant mercenary Wade Wilson (a.k.a. Deadpool) assembles a team of fellow mutant rogues to protect a young boy with abilities from the brutal, time-traveling cyborg Cable',
          backImageName: 'Deadpool_2',
          posterImageName: 'Deadpool_2',
          vote: '7.7',
          date: DateTime.now()),
    );

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MovieDetails.routeName,
                  arguments: MovieDetailsArguments(
                      selectedMovie: movies_new_releases[index],
                      moviesRecommended: movies_recommended),
                );
              },
              child: PopularMovieItem(
                movie: movies_new_releases[index],
              ),
            ),
            itemCount: 6,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 27.w, top: 13.h, bottom: 13.h),
          width: 455.62.w,
          height: 187.h,
          color: AppTheme.dark2Gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Releases ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MovieDetails.routeName,
                        arguments: MovieDetailsArguments(
                            selectedMovie: movies_new_releases[index],
                            moviesRecommended: movies_recommended),
                      );
                    },
                    child: UpcomingMovieItem(
                      movie: movies_new_releases[index],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 24.w,
            bottom: 17.h,
          ),
          width: 565.w,
          height: 246.h,
          color: AppTheme.dark2Gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recomended ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MovieDetails.routeName,
                        arguments: MovieDetailsArguments(
                            selectedMovie: movies_recommended[index],
                            moviesRecommended: movies_recommended),
                      );
                    },
                    child: TopRatedMovieItem(
                      movie: movies_recommended[index],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}

class MovieDetailsArguments {
  final MovieModel selectedMovie;
  final List<MovieModel> moviesRecommended;

  MovieDetailsArguments({
    required this.selectedMovie,
    required this.moviesRecommended,
  });
}
