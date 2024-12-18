import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/movies/movie_details.dart';
import 'package:movies/search/data/models/resultss.dart';
import 'package:movies/shared/api_constant.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class SearchItem extends StatelessWidget {
   SearchItem( this.movie,{super.key});
final Resultss movie;
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: ()=>Navigator.of(context).pushNamed(MovieDetails.routeName),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: CachedNetworkImage(
                        imageUrl: '${ApiConstant.baseUrlImage}${movie.backdropPath}' ??
                            'https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg',
                        width: 96.w,
                        height: 127.h,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const LoadingIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported_outlined),
                            ),
              ),
            SizedBox(width: 10),
          
            Expanded(
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                    fontSize: 15
                  ),
                  
                  ),
                  Text(movie.releaseDate ?? '',
                  maxLines: 1, 
                 overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                     
                  ),),
                  Text(movie.overview ?? '',
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
      ),
    );
  }}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies/search/data/models/resultss.dart';
// import 'package:movies/shared/api_constant.dart';
// import 'package:movies/shared/widgets/loading_indicator.dart';

// class SearchItem extends StatelessWidget {
//   const SearchItem(this.movie, {super.key});

//   final Resultss movie;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           // صورة الفيلم
//           ClipRRect(
//             borderRadius: BorderRadius.circular(3),
//             child: CachedNetworkImage(
//               imageUrl: movie.backdropPath != null
//                   ? '${ApiConstant.baseUrlImage}${movie.backdropPath}'
//                   : 'https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg',
//               width: 96.w,
//               height: 127.h,
//               fit: BoxFit.fill,
//               placeholder: (context, url) => const LoadingIndicator(),
//               errorWidget: (context, url, error) =>
//                   const Icon(Icons.image_not_supported_outlined),
//             ),
//           ),
//           SizedBox(width: 10.w),

//           // معلومات الفيلم
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // عنوان الفيلم
//                 Text(
//                   movie.title ?? 'No Title',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 SizedBox(height: 5.h),

//                 // تاريخ الإصدار
//                 Text(movie.releaseDate ?? '',
//               maxLines: 1, 
//              overflow: TextOverflow.ellipsis,
//               style: Theme.of(context).textTheme.titleMedium ?.copyWith(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w300,
                 
//               ),),
//                 SizedBox(height: 5.h),

//                   Text(movie.overview ?? '',
//               maxLines: 1, 
//                          overflow: TextOverflow.ellipsis,
//               style: Theme.of(context).textTheme.titleMedium ?.copyWith(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w300,
                
//               ),)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }