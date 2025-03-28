import 'package:flutter/material.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/media_lists_views/movie_grid_view.dart';

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
      ),
    );
  }
}
