import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/tabs/category/data/models/response.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CategoryFilteredMoviesFilteredItem extends StatelessWidget{
  
   const CategoryFilteredMoviesFilteredItem(this.movies, {super.key});
final Results movies;
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
                      imageUrl: '${ApiConstant.baseUrlImage}${movies.backdropPath}' ??
                          'https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg',
                      width: 96.w,
                      height: 127.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported_outlined),
                          ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movies.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                  fontSize: 15
                ),
                
                ),
                Text(movies.releaseDate ?? '',
                maxLines: 1, 
               overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                   
                ),),
                Text(movies.overview ?? '',
                maxLines: 1, 
                           overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}