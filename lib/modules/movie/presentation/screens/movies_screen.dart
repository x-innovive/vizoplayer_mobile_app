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
import '../widgets/movie_cover.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  final String title;

  const MoviesScreen({super.key, required this.title});

  @override
  ConsumerState createState() => _HomeCategoryDetailsScreenState();
}

class _HomeCategoryDetailsScreenState extends ConsumerState<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppbarAndCategoryTab(
      appBarTitle: widget.title,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.paddingNormal,
            ),
            child: MovieCover(
              assetPath: 'assets/temps/movie_covers/lordorthe.png',
              onPlayTap: () {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.movieDetailScreen,
                  extra: getMovieList().first,
                );
              },
              onFavTap: () {},
            ),
          ),
          const SizedBox(height: AppValues.paddingLarge),
          HorizontalMovieList(
            title: 'Latest Movies',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Popular Movies',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Today’s Pick for You',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Comedy Movies',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Action Movies',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
                extra: movie,
              );
            },
          ),
          const SizedBox(height: AppValues.paddingNormal * 2),
          HorizontalMovieList(
            title: 'Hollywood Movies',
            movieList: getMovieList(),
            horizontalPadding: AppValues.paddingNormal,
            onMovieTap: (movie) {
              AppNav.goRouter.push(
                RouteNames.homeScreen + RouteNames.movieDetailScreen,
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
