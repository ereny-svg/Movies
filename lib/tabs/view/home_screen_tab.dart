import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tabs/view/movie_model.dart';
import 'package:movies/tabs/view/popular_movie_item.dart';
import 'package:movies/tabs/view/top_rated_movie_item.dart';
import 'package:movies/tabs/view/upcoming_movie_item.dart';

class HomeScreenTab extends StatelessWidget {
  static const String routeName = '/home_tab';
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = List.generate(
      6,
      (index) => MovieModel(
          id: '${index + 1}',
          title: 'Dora and the lost city of gold',
          overview:
              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
          backImageName: 'backimage',
          posterImageName: 'posterimage',
          vote: '7.7',
          date: '2019  PG-13  2h 7m'),
    );

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) => PopularMovieItem(
              movie: movies[index],
            ),
            itemCount: 6,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 13),
          width: 455.62,
          height: 187,
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
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => UpcomingMovieItem(
                    movie: movies[index],
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            left: 24,
            bottom: 17,
          ),
          width: 565,
          height: 246,
          color: AppTheme.dark2Gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recomended ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TopRatedMovieItem(
                    movie: movies[index],
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
