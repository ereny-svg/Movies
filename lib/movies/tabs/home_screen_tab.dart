import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/popularmovies/view/popular_movie_list.dart';
import 'package:movies/recommendedmovies/view/top_rated_movie_list.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/upcomingmovies/view/upcoming_movie_list.dart';

// ignore: must_be_immutable
class HomeScreenTab extends StatefulWidget {
  static const String routeName = '/home_tab';
 HomeScreenTab(this.popularmovies,{super.key,});
  List<ResultsforPopular>popularmovies;
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: PopularMovieList()),
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
              const Expanded(child: UpcomingMovieList())
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
              const Expanded(child: TopRatedMovieList())
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

