import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_values.dart';
import 'movie_list_tile.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<String> movieList;

  const HorizontalMovieList({
    super.key,
    required this.title,
    this.onSeeAllClick,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const Row(
              children: [
                Text('See All'),
                SizedBox(width: 4),
                ImageIcon(
                  AssetImage('assets/icons/basic_icons/arrow_right.png'),
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppValues.paddingSmall),
        SizedBox(
          height: 160,
          child: ListView.builder(
            itemCount: movieList.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieListTile(
                movie: movieList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
