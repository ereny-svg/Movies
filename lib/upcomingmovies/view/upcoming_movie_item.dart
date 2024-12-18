import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/triangle_clipper.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/upcomingmovies/data/model/results.dart';

class UpcomingMovieItem extends StatelessWidget {
  const UpcomingMovieItem({super.key, required this.movie});
  final Results movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:CachedNetworkImage(
                 imageUrl: '${ApiConstant.baseUrlImage}${movie.posterPath}' ??
                          'https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg',
                width: 96.87.w,
                height: 127.74.h,
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
                child: const Icon(
                  Icons.add,
                  color: AppTheme.white,
                  size: 17,
                ),
              ),
            )
          ],
        ),
         SizedBox(
          width: 13.w,
        )
      ],
    );
  }
}
