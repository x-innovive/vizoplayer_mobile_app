import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_values.dart';
import 'horizontal_audio_list_tile.dart';
import 'title_and_see_all.dart';

class HorizontalAudioList extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<String> audioList;
  final double horizontalPadding;

  const HorizontalAudioList({
    super.key,
    required this.title,
    this.onSeeAllClick,
    required this.audioList,
    required this.horizontalPadding,
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
            itemCount: audioList.length,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HorizontalAudioListTile(
                audio: audioList[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
