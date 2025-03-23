import 'package:flutter/material.dart';

import '../../../modules/movie/business/entity/movie.dart';
import '../../resources/app_values.dart';

class HorizontalMovieListTile extends StatelessWidget {
  final Movie movie;
  final bool ignoreHeight;
  final Function(Movie)? onTap;

  const HorizontalMovieListTile({
    super.key,
    required this.movie,
    required this.onTap,
    this.ignoreHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: InkWell(
        onTap: () {
          onTap?.call(movie);
        },
        child: Image.asset(
          movie.cover ?? '',
          height: ignoreHeight ? null : 160,
          width: ignoreHeight ? null : 106.66,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
