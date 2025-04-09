import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/media_lists_views/horizontal_movie_list.dart';
import '../../../../core/widgets/scaffold_with_appbar_and_category_tab.dart';
import '../../../../core/widgets/tabs/category_tab.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';
import '../../../movie/presentation/widgets/movie_cover.dart';

class TvShowsScreen extends ConsumerStatefulWidget {
  const TvShowsScreen({super.key});

  @override
  ConsumerState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends ConsumerState<TvShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppbarAndCategoryTab(
      appBarTitle: 'TV Shows',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.paddingNormal,
            ),
            child: MovieCover(
              assetPath: 'assets/temps/movie_covers/zila.png',
              onFavTap: () {},
              onPlayTap: () {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                  extra: getMovieList().first,
                );
              },
            ),
          ),
          const SizedBox(height: AppValues.paddingLarge),
          HorizontalMovieList(
            title: 'Critically Acclaimed TV Shows',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Medical TV Dramas',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Today’s Top Picks for You',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'US TV Shows',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'International TV Dramas',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Familiar TV Favourites',
            movieList: getMovieList(),
            hideSeeAllButton: true,
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.tvShowsDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingLarge),
        ],
      ),
    );
  }
}
