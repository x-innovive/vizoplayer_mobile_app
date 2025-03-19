import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class MovieListTile extends StatelessWidget {
  final String movie;

  const MovieListTile({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 4,
        ),
        child: Image.asset(
          movie,
          height: 160,
          width: 106.66,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
