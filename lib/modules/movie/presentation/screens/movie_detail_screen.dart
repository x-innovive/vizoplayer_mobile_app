import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/media_lists_views/movie_grid_view.dart';
import '../../../../core/widgets/media_lists_views/title_and_see_all.dart';
import '../../../../core/widgets/utility/invalid_data_widget.dart';
import '../../business/entity/movie.dart';
import '../widgets/chewie_movie_player.dart';
import '../widgets/movie_description_widget.dart';
import '../widgets/movie_player.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final Movie? movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  ConsumerState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: ''),
      body: widget.movie == null
          ? const InvalidDataWidget(message: 'Invalid data')
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChewieMoviePlayer(url: widget.movie?.url),
                // MoviePlayer(url: widget.movie?.url ?? ''),
                const SizedBox(height: AppValues.paddingNormal),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
                          child: MovieDescriptionWidget(
                            onPlay: () {},
                            onFav: () {},
                            onLike: () {},
                          ),
                        ),
                        const SizedBox(height: AppValues.paddingLarge),
                        MovieGridView(
                          movieList: getMovieList(),
                          horizontalPadding: AppValues.paddingNormal,
                          title: 'More Like This',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
