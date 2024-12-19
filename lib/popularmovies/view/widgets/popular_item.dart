import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/popularmovies/data/model/results.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/triangle_clipper.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PopularItem extends StatelessWidget {
  const PopularItem({super.key, required this.movie});
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 28),
      width: 412.w,
      height: 289.h,
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl:  '${ApiConstant.baseUrlImage}${movie.backdropPath}'?? 'https://st4.depositphotos.com/17828278/24401/v/450/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg',
                width: 412.w,
                height: 217.h,
                fit: BoxFit.fill,
                placeholder: (_, __) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (_, __, ___) => const Icon(
                Icons.image_not_supported_outlined,),
              ),
              Container(
                margin: EdgeInsets.only(top: 79.h, left: 176.w),
                child: Icon(
                  Icons.play_circle_fill_outlined,
                  size: 70.sp,
                  color: AppTheme.white,
                ),
              ),
              Container(
                margin:  EdgeInsets.only(top: 231.h, left: 164.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title??'',
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
                margin: EdgeInsets.only(top: 90.h, left: 21.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/${movie.posterPath}.png',
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
