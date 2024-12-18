import 'package:flutter/material.dart';
import 'package:movies/search/view/widgets/search_list.dart';
import 'package:movies/shared/app_theme.dart';

class SearchScreenTab extends StatefulWidget {
  const SearchScreenTab({super.key});

  @override
  State<SearchScreenTab> createState() => _SearchScreenTabState();
}

class _SearchScreenTabState extends State<SearchScreenTab> {
   final controller = TextEditingController();
    String searchQuery = ""; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25 ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // تحديث النص في `searchQuery`
                });
              }, 
              controller: controller,
              style:const TextStyle(
                fontSize: 13,
                fontWeight:FontWeight.w400,
                color: AppTheme.white
              ),
              decoration:InputDecoration(
                hintText:'search',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                prefixIcon: Icon(Icons.search, color: AppTheme.white,) ,
                fillColor: AppTheme.neutralGray,
                filled:  true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.5),
                  borderSide: BorderSide(color: AppTheme.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.5),
                    borderSide: BorderSide(color: AppTheme.white)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.5),
                    borderSide: BorderSide(color: AppTheme.white)
                )
                  
                  
              ) ,
            ),
          ),
        ),
        SizedBox(height: 13,),
        if (searchQuery.isNotEmpty)
          Expanded(
            child: SearchList(query: searchQuery),) // استدعاء القائمة بناءً على النص المدخل
        
      ],
    ); 
      
  }
}