import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/main_shell_app_bar.dart';
import '../../../movie/presentation/widgets/movie_cover.dart';
import '../../../../core/widgets/media_lists_views/horizontal_audio_list.dart';
import '../../../../core/widgets/media_lists_views/horizontal_movie_list.dart';
import '../../../../core/widgets/media_lists_views/horizontal_tv_list.dart';
import '../../../../core/widgets/tabs/category_tab.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainShellAppBar(
        onSearchIconTap: () {
          log('search');
        },
        onBellIconTap: () {
          log('notification bell');
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: AppValues.paddingNormal),
              child: CategoryTab(
                // onCategoryTap: (category) {
                //   log(category);
                //   switch (category) {
                //     case 'Movies':
                //       AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.moviesScreen);
                //     case 'TV Shows':
                //       AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.tvShowsScreen);
                //   }
                // },
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingNormal,
              ),
              child: MovieCover(
                assetPath: 'assets/temps/movie_covers/joker.png',
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
              onSeeAllClick: () {},
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalTvList(
              title: 'Live TV',
              tvList: tvList,
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Blockbuster US Action Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
              onMovieTap: (movie) {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.movieDetailScreen,
                  extra: movie,
                );
              },
              onSeeAllClick: () {},
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Video Club',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
              onMovieTap: (movie) {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.movieDetailScreen,
                  extra: movie,
                );
              },
              onSeeAllClick: () {},
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Asian Movies & TV',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
              onMovieTap: (movie) {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.movieDetailScreen,
                  extra: movie,
                );
              },
              onSeeAllClick: () {},
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalAudioList(
              title: 'Audio Club',
              audioList: audioList,
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Suspenseful TV Dramas',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
              onMovieTap: (movie) {
                AppNav.goRouter.push(
                  RouteNames.homeScreen + RouteNames.movieDetailScreen,
                  extra: movie,
                );
              },
              onSeeAllClick: () {},
            ),
            const SizedBox(height: AppValues.paddingLarge),
          ],
        ),
      ),
    );
  }
}
