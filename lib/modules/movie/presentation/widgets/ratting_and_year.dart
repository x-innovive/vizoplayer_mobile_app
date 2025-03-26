import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';

class RatingAndYear extends StatelessWidget {
  final double ratting;
  final String year;

  const RatingAndYear({
    super.key,
    required this.ratting,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 15,
        ),
        const SizedBox(width: 4),
        Text(
          ratting.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: AppValues.paddingSmall),
        Text(year),
      ],
    );
  }
}
