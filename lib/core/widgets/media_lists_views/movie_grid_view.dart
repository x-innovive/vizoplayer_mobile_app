import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../modules/movie/business/entity/movie.dart';
import '../../resources/app_values.dart';
import 'horizontal_movie_list_tile.dart';
import 'title_and_see_all.dart';

class MovieGridView extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<Movie> movieList;
  final double horizontalPadding;
  final Function(Movie)? onMovieTap;

  const MovieGridView({
    super.key,
    required this.title,
    this.onSeeAllClick,
    required this.movieList,
    required this.horizontalPadding,
    this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppValues.paddingNormal,
          ),
          child: TitleAndSeeAll(
            title: title,
            onSeeAllTap: () {},
          ),
        ),
        const SizedBox(height: AppValues.paddingSmall),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: movieList.length,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HorizontalMovieListTile(
              movie: movieList[index],
              onTap: onMovieTap,
              ignoreHeight: true,
            );
          },
        ),
      ],
    );
  }
}
