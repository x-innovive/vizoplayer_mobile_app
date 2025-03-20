import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_values.dart';
import 'horizontal_movie_list_tile.dart';
import 'title_and_see_all.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<String> movieList;
  final double horizontalPadding;
  final Function(String)? onMovieTap;

  const HorizontalMovieList({
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
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: TitleAndSeeAll(
            title: title,
            onSeeAllTap: onSeeAllClick,
          ),
        ),
        const SizedBox(height: AppValues.paddingSmall),
        SizedBox(
          height: 160,
          child: ListView.builder(
            itemCount: movieList.length,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HorizontalMovieListTile(
                movie: movieList[index],
                onTap: onMovieTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
