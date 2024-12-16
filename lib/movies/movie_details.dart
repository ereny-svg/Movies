import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/movie_type.dart';
import 'package:movies/movies/tabs/home_screen_tab.dart';
import 'package:movies/movies/view/top_rated_movie_item.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/triangle_clipper.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = '/movie_details';
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MovieDetailsArguments;
    final selectedMovie = args.selectedMovie;
    final moviesRecommended = args.moviesRecommended;
    final List<String> movieGenres = ['Action', 'Drama', 'Comedy', 'Romantic'];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              width: 412.w,
              height: 62.h,
              decoration: const BoxDecoration(color: AppTheme.dark2Gray),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      selectedMovie.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/${selectedMovie.backImageName}.png',
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
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedMovie.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  selectedMovie.date.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 199.h,
                  width: 372.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/images/${selectedMovie.posterImageName}.png',
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
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 65.h,
                            width: 230.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: movieGenres.map((genre) {
                                  return MovieType(typeName: genre);
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: SizedBox(
                              width: 231.w,
                              height: 78.h,
                              child: SingleChildScrollView(
                                child: Text(
                                  selectedMovie.overview,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 13.0,
                                      ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 10.h),
                            child: SizedBox(
                              height: 27.h,
                              // width: 51.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: AppTheme.darkYellow,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    selectedMovie.vote,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
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
                  'More Like this',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          MovieDetails.routeName,
                          arguments: MovieDetailsArguments(
                              selectedMovie: moviesRecommended[index],
                              moviesRecommended: moviesRecommended),
                        );
                      },
                      child: TopRatedMovieItem(
                        movie: moviesRecommended[index],
                      ),
                    ),
                    itemCount: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
