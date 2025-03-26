import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';

class MovieAtributeWidget extends StatelessWidget {
  final MainAxisAlignment? alignment;

  const MovieAtributeWidget({super.key, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      children: [
        ...['16+', 'HD', 'Duration: 50m'].map((e) {
          return Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
              border: Border.all(
                width: 1,
                color: const Color(0xFF989899),
              ),
            ),
            alignment: Alignment.center,
            child: Text(e),
          );
        }),
      ],
    );
  }
}
