import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/popularmovies/view/popular_movie_list.dart';
import 'package:movies/recommendedmovies/view/top_rated_movie_list.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movies/view/movie_model.dart';
import 'package:movies/upcomingmovies/view/upcoming_movie_list.dart';

class HomeScreenTab extends StatefulWidget {
  static const String routeName = '/home_tab';
 HomeScreenTab(this.popularmovies,{super.key,});
  List<Results>popularmovies;
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularMovieList(),
        // Expanded(
        //   child: PageView.builder(
        //     controller: pageController,
        //     physics: const PageScrollPhysics(),
        //     itemBuilder: (context, index) =>PopularItem(
        //          movie: widget.popularmovies[index],
        //       ),
        //     // itemBuilder: (context, index) => GestureDetector(
        //     //   onTap: () {
        //     //     Navigator.of(context).pushNamed(
        //     //       MovieDetails.routeName,
        //     //       arguments: MovieDetailsArguments(
        //     //           selectedMovie: movies_new_releases[index],
        //     //           moviesRecommended: movies_recommended),
        //     //     );
        //     //   },
        //     //   child: PopularItem(
        //     //     movie: widget.popularmovies[index],
        //     //   ),
        //     // ),
        //     itemCount: widget.popularmovies.length,
        //     onPageChanged: (index) {
        //       currentPageIndex = index;
        //     },
        //   ),
        // ),
        Container(
          padding: EdgeInsets.only(left: 24.w, top: 10.h, bottom: 10.h),
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
              UpcomingMovieList()
              // Expanded(
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => UpcomingMovieItem(
              //         movie: movies_new_releases[index],
              //        ),
              //     itemBuilder: (context, index) => GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pushNamed(
              //           MovieDetails.routeName,
              //           arguments: MovieDetailsArguments(
              //               selectedMovie: movies_new_releases[index],
              //               moviesRecommended: movies_recommended),
              //         );
              //       },
              //       child: UpcomingMovieItem(
              //         movie: movies_new_releases[index],
              //       ),
              //     ),
              //     itemCount: 6,
              //   ),
              // ),
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
            bottom: 14.h,
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
                height: 12.h,
              ),
              TopRatedMovieList()
              // Expanded(
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pushNamed(
              //           MovieDetails.routeName,
              //           arguments: MovieDetailsArguments(
              //               selectedMovie: movies_recommended[index],
              //               moviesRecommended: movies_recommended),
              //         );
              //       },
              //       child: TopRatedMovieItem(
              //         movie: movies_recommended[index],
              //       ),
              //     ),
              //     itemCount: 6,
              //   ),
              // ),
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
