import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/movie_type.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/popularmovies/view/popular_movie_item.dart';
import 'package:movies/popularmovies/view/small_popular_movie_tem.dart';
import 'package:movies/recommendedmovies/data/model/results.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/movie_details_arguments.dart';
import 'package:movies/shared/triangle_clipper.dart';
import 'package:movies/recommendedmovies/view/top_rated_movie_item.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';
import 'package:movies/upcomingmovies/view/upcoming_movie_item.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = '/movie_details';
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MovieDetailsArguments;

    bool isRecommended = args.moviesRecommended.isNotEmpty;
    bool isPopular = args.moviesPopular.isNotEmpty;
    bool isUpComing = args.moviesUpComing.isNotEmpty;
    ResultsOfRecommended recommendedMovie = args.recommendedMovie ;
    ResultsforPopular popularMovie = args.popularMovie;
    Results upComingMovie = args.upComingMovie ;
    final moviesRecommended = isRecommended? args.moviesRecommended : isPopular? args.moviesPopular : args.moviesUpComing ;
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
                      isRecommended? recommendedMovie.title ?? '' : isPopular ? popularMovie.title ?? '' : upComingMovie.title ?? '',
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
                     CachedNetworkImage(
                      imageUrl:
                          '${ApiConstant.baseUrlImage}${
                            isRecommended? recommendedMovie.posterPath ?? '' : isPopular ? popularMovie.posterPath ?? '' : upComingMovie.posterPath ?? ''
                            }',
                      width: 412.w,
                      height: 217.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported_outlined),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isRecommended? recommendedMovie.title ?? '' : isPopular ? popularMovie.title ?? '' : upComingMovie.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 18),
                ),
                SizedBox(height: 7.h),
                Text(
                  isRecommended? recommendedMovie.releaseDate ?? '' : isPopular ? popularMovie.releaseDate ?? '' : upComingMovie.releaseDate ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                                  imageUrl:
                                      '${ApiConstant.baseUrlImage}${
                            isRecommended? recommendedMovie.posterPath ?? '' : isPopular ? popularMovie.posterPath ?? '' : upComingMovie.posterPath ?? ''
                                        }',
                                  width: 129.w,
                                  height: 199.h,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                      const LoadingIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                          Icons.image_not_supported_outlined),
                                )
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
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: movieGenres.map((genre) {
                                  return MovieType(typeName: genre);
                                }).toList(),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                                isRecommended? recommendedMovie.overview ?? '' : isPopular ? popularMovie.overview ?? '' : upComingMovie.overview ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 13.0),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: AppTheme.darkYellow,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                  isRecommended? recommendedMovie.voteAverage?.toStringAsFixed(1)?? '' : isPopular ? popularMovie.voteAverage?.toStringAsFixed(1) ?? '' : upComingMovie.voteAverage?.toStringAsFixed(1) ?? ''
,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Text(
              'More Like This',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 15.sp),
            ),
          ),
          Expanded(
            child: isRecommended? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: args.moviesRecommended.length,
              itemBuilder: (context, index) {
                final movie = args.moviesRecommended[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      MovieDetails.routeName,
                      arguments: MovieDetailsArguments(
                        moviesRecommended:isRecommended? args.moviesRecommended : [],
                        moviesPopular: isPopular ? args.moviesPopular : [],
                        moviesUpComing: isUpComing? args.moviesUpComing : [],
                        popularMovie: isPopular ? args.moviesPopular[index] : ResultsforPopular(),
                        recommendedMovie: isRecommended? args.moviesRecommended[index] : ResultsOfRecommended(),
                        upComingMovie: isUpComing? args.moviesUpComing[index] : Results(),
                      ),
                    );
                  },
                  child:TopRatedMovieItem(movie: movie), 
                );
              },
            ) : isUpComing? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: args.moviesUpComing.length,
              itemBuilder: (context, index) {
                final movie = args.moviesUpComing[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      MovieDetails.routeName,
                      arguments: MovieDetailsArguments(
                        moviesRecommended:isRecommended? args.moviesRecommended : [],
                        moviesPopular: isPopular ? args.moviesPopular : [],
                        moviesUpComing: isUpComing? args.moviesUpComing : [],
                        popularMovie: isPopular ? args.moviesPopular[index] : ResultsforPopular(),
                        recommendedMovie: isRecommended? args.moviesRecommended[index] : ResultsOfRecommended(),
                        upComingMovie: isUpComing? args.moviesUpComing[index] : Results(),
                      ),
                    );
                  },
                  child:UpcomingMovieItem(movie: movie), 
                );
              },
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: args.moviesPopular.length,
              itemBuilder: (context, index) {
                final movie = args.moviesPopular[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      MovieDetails.routeName,
                      arguments: MovieDetailsArguments(
                        moviesRecommended:isRecommended? args.moviesRecommended : [],
                        moviesPopular: isPopular ? args.moviesPopular : [],
                        moviesUpComing: isUpComing? args.moviesUpComing : [],
                        popularMovie: isPopular ? args.moviesPopular[index] : ResultsforPopular(),
                        recommendedMovie: isRecommended? args.moviesRecommended[index] : ResultsOfRecommended(),
                        upComingMovie: isUpComing? args.moviesUpComing[index] : Results(),
                      ),
                    );
                  },
                  child:SmallPopularMovieTem(movie: movie), 
                );
              },
            )),
        ],
      ),
    );
  }
}
