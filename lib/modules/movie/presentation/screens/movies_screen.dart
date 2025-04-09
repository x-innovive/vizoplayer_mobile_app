import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../widgets/movie_cover.dart';
import '../../../../core/widgets/media_lists_views/horizontal_movie_list.dart';
import '../../../../core/widgets/tabs/category_tab.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  final String title;

  const MoviesScreen({super.key, required this.title});

  @override
  ConsumerState createState() => _HomeCategoryDetailsScreenState();
}

class _HomeCategoryDetailsScreenState extends ConsumerState<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: widget.title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const CategoryTab(
              // onCategoryTap: (category) {
              //   AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.moviesScreen);
              // },
            ),
            const SizedBox(height: 16),
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
      ),
    );
  }
}
