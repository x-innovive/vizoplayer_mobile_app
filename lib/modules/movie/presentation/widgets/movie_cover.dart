import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'genre_and_language.dart';
import 'movie_atribute_widget.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/button_with_icon.dart';

class MovieCover extends StatelessWidget {
  final String assetPath;
  final Function()? onPlayTap;
  final Function()? onFavTap;

  const MovieCover({
    super.key,
    required this.assetPath,
    this.onPlayTap,
    this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    final coverPhotoWidth = (MediaQuery.of(context).size.width / 3) * 1.9;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(
          AppValues.borderRadiusSmall,
        ),
      ),
      // padding: const EdgeInsets.only(
      //   left: 56,
      //   right: 56,
      //   top: AppValues.paddingNormal,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppValues.paddingNormal),
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppValues.borderRadiusSmall,
            ),
            child: Image.asset(
              width: coverPhotoWidth,
              assetPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: AppValues.paddingNormal - 2),
          const MovieAtributeWidget(),
          const SizedBox(height: AppValues.paddingNormal),
          const GenreAndLanguage(genre: 'violence', language: 'English'),
          const SizedBox(height: AppValues.paddingNormal - 4),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 3) * 1.9,
            child: Row(
              children: [
                Expanded(
                  child: ButtonWithIcon(
                    title: 'Play',
                    onTap: onPlayTap,
                    icon: const Icon(
                      Icons.play_arrow,
                      color: AppColors.scaffoldBlack,
                    ),
                    childColor: AppColors.scaffoldBlack,
                    bgColor: Colors.white,
                  ),
                ),
                const SizedBox(width: AppValues.paddingNormal - 4),
                Expanded(
                  child: ButtonWithIcon(
                    title: 'My List',
                    onTap: onFavTap,
                    icon: const Icon(
                      CupertinoIcons.suit_heart,
                      size: 20,
                      // color: AppColors.scaffoldBlack,
                    ),
                    childColor: Colors.white,
                    // bgColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppValues.paddingNormal),
        ],
      ),
    );
  }
}
