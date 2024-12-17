import 'package:flutter/material.dart';
import 'package:movies/home/view/home_screen.dart';
import 'package:movies/movies/tabs/home_screen_tab.dart';
import 'package:movies/popularmovies/view_model/popular_view_model.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class PopularMovieList extends StatefulWidget {
  const PopularMovieList({super.key});

  @override
  State<PopularMovieList> createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  final viewModel = PopularViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<PopularViewModel>(
          builder: (_, viewModel, __) {
            if (viewModel.isLoading) {
              print('rrrrrrrr');
              return LoadingIndicator();
            } else if (viewModel.errorMessage != null) {
              print('wwwwww');
              return ErrorIndicator();
            } else {
              print('r');
              return HomeScreenTab(viewModel.movies);
            }
          },
        ));
  }
}
