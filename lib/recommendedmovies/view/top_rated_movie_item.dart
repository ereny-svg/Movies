import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/recommendedmovies/data/model/results.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/triangle_clipper.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class TopRatedMovieItem extends StatelessWidget {
  const TopRatedMovieItem({super.key, required this.movie});
  final ResultsOfRecommended movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 97.w,
          height: 186.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: '${ApiConstant.baseUrlImage}${movie.posterPath}' ,
                      width: 96.w,
                      height: 127.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported_outlined),
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
                      child: Icon(
                        Icons.add,
                        color: AppTheme.white,
                        size: 17.sp,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                height: 50.h,
                width: 97.w,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15.sp,
                            color: AppTheme.darkYellow,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            movie.voteAverage.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 10.sp),
                          )
                        ],
                      ),
                      Text(
                        movie.originalTitle ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 10.sp),
                      ),
                      Text(
                        movie.releaseDate.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 8.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 14.w,
        )
      ],
    );
  }
}
