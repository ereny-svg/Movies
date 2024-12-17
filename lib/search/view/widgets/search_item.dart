import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.asset('assets/images/search1221.png',)
            ),
          SizedBox(width: 10),
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Alita Battle Angel",
              style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                fontSize: 15
              ),),
              Text("2019",
              style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w300
              ),),
              Text("Rosa Salazar, Christoph Waltz",
              style: Theme.of(context).textTheme.titleMedium ?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w300
              ),)
            ],
          )
        ],
      ),
    );
  }
}