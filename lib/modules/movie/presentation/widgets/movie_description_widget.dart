import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/button_with_icon.dart';
import '../../../../core/widgets/buttons/circle_icon_button.dart';
import '../../../tv_shows/presentation/widgets/season_and_episode.dart';
import 'genre_and_language.dart';
import 'movie_atribute_widget.dart';
import 'ratting_and_year.dart';
import 'title_value.dart';

class MovieDescriptionWidget extends StatelessWidget {
  final Function() onPlay;
  final Function() onFav;
  final Function() onLike;
  final bool? isTvShow;

  const MovieDescriptionWidget({
    super.key,
    required this.onPlay,
    required this.onFav,
    required this.onLike,
    this.isTvShow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'The Batman',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppValues.paddingNormal),
        const MovieAtributeWidget(alignment: MainAxisAlignment.start),
        const SizedBox(height: AppValues.paddingSmall + 4),
        if (isTvShow == true)
          const SeasonAndEpisode(seasonSrt: 'Season 1', episodeSrt: "Episode 1"),
        const SizedBox(height: AppValues.paddingSmall + 4),
        const GenreAndLanguage(
          genre: 'violence',
          language: 'English',
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: AppValues.paddingSmall + 4),
        const RatingAndYear(ratting: 7.6, year: '2050'),
        const SizedBox(height: AppValues.paddingNormal),
        Row(
          children: [
            Expanded(
              child: ButtonWithIcon(
                onTap: onPlay,
                title: 'Play',
                icon: const Icon(
                  Icons.play_arrow,
                  color: AppColors.scaffoldBlack,
                ),
                childColor: AppColors.scaffoldBlack,
                bgColor: Colors.white,
              ),
            ),
            const SizedBox(width: AppValues.paddingSmall + 2),
            CircleIconButton(
              onTap: () {},
              icon: Image.asset(
                'assets/icons/basic_icons/love.png',
                height: 16,
                width: 14,
              ),
            ),
            const SizedBox(width: AppValues.paddingSmall + 2),
            CircleIconButton(
              onTap: () {},
              icon: Image.asset(
                'assets/icons/basic_icons/thumbsup.png',
                height: 16,
                width: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppValues.paddingNormal),
        const Text(
          'The series was initially intended as a limited series to be told in two parts. It had its original run of 15.',
        ),
        const SizedBox(height: AppValues.paddingLarge),
        const TitleValue(title: 'MPAA Rating', value: 'PG-13'),
        const SizedBox(height: AppValues.paddingSmall),
        const TitleValue(title: 'Genre', value: 'Movies'),
        const SizedBox(height: AppValues.paddingSmall),
        const TitleValue(title: 'Actor', value: 'Úrsula Corberó, Itziar Ituño, Álvaro Morte, Alba Flores, Pedro Alonso'),
        const SizedBox(height: AppValues.paddingSmall),
        const TitleValue(title: 'Director', value: 'Álex Pina'),
        const SizedBox(height: AppValues.paddingSmall),
        const TitleValue(title: 'Country', value: 'French'),
        const SizedBox(height: AppValues.paddingSmall),
      ],
    );
  }
}
