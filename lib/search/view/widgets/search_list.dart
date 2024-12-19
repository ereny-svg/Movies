import 'package:flutter/material.dart';
import 'package:movies/search/data/data_source/search_api_data_source.dart';
import 'package:movies/search/view/widgets/search_item.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';


class SearchList extends StatefulWidget {
  const SearchList({required this.query, super.key});
  final  String query ;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SearchApiDataSource.SearchMovies(widget.query),
      builder:(context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError ) {
          return const ErrorIndicator();
        } else {
          final newList = snapshot.data?.results ?? [];
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 10),
         itemBuilder: (_, index) => SearchItem(newList[index]),
        itemCount: newList.length,
        );
          }
      }, 
    );
  }
}