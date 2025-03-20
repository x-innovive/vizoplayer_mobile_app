import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/media/movie_cover.dart';
import '../../../../core/widgets/media_lists_views/horizontal_movie_list.dart';
import '../../../../core/widgets/tabs/category_tab.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';

class HomeCategoryDetailsScreen extends ConsumerStatefulWidget {
  const HomeCategoryDetailsScreen({super.key});

  @override
  ConsumerState createState() => _HomeCategoryDetailsScreenState();
}

class _HomeCategoryDetailsScreenState extends ConsumerState<HomeCategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Movies'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: AppValues.paddingNormal),
              child: CategoryTab(
                onCategoryTap: (category) {
                  AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.homeCategoryDetailsScreen);
                },
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingNormal,
              ),
              child: MovieCover(
                assetPath: 'assets/temps/movie_covers/lordorthe.png',
              ),
            ),
            const SizedBox(height: AppValues.paddingLarge),
            HorizontalMovieList(
              title: 'Latest Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Popular Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Today’s Pick for You',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Comedy Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Action Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingNormal * 2),
            HorizontalMovieList(
              title: 'Hollywood Movies',
              movieList: getMovieList(),
              horizontalPadding: AppValues.paddingNormal,
            ),
            const SizedBox(height: AppValues.paddingLarge),
          ],
        ),
      ),
    );
  }
}
