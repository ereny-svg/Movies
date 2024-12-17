import 'package:flutter/material.dart';
import 'package:movies/search/view/widgets/search_item.dart';

class SearchList extends StatelessWidget {
   SearchList(this.query,{super.key});
  String query ;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(separatorBuilder: (_, __) {
    return const SizedBox(
          height: 10,
        ); 
    },
      itemBuilder: (_, index) =>SearchItem() ,
      itemCount: 10,
      );
  }
}