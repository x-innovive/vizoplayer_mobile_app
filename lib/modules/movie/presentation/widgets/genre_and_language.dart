import 'package:flutter/material.dart';

class GenreAndLanguage extends StatelessWidget {
  final String genre;
  final String language;
  final MainAxisAlignment? mainAxisAlignment;

  const GenreAndLanguage({
    super.key,
    required this.genre,
    required this.language,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(genre),
        const SizedBox(width: 8),
        const Icon(
          Icons.circle,
          size: 4,
        ),
        const SizedBox(width: 8),
        Text(language),
      ],
    );
  }
}
