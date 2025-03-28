import 'package:flutter/material.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/media_lists_views/movie_grid_view.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';

class TvShowMoreLikeThisPage extends StatelessWidget {
  const TvShowMoreLikeThisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppValues.paddingNormal),
      child: MovieGridView(
        title: '',
        movieList: getMovieList(),
        horizontalPadding: AppValues.paddingNormal,
        onMovieTap: (movie) {
          AppNav.goRouter.push(
            RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
            extra: movie,
          );
        },
      ),
    );
  }
}
