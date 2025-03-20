import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class HorizontalMovieListTile extends StatelessWidget {
  final String movie;
  final Function(String)? onTap;

  const HorizontalMovieListTile({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 4,
        ),
        child: InkWell(
          onTap: () {
            onTap?.call(movie);
          },
          child: Image.asset(
            movie,
            height: 160,
            width: 106.66,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
