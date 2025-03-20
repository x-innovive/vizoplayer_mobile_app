import 'package:flutter/material.dart';

import '../../resources/app_values.dart';
import 'horizontal_tv_list_tile.dart';
import 'title_and_see_all.dart';

class HorizontalTvList extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<String> tvList;
  final horizontalPadding;

  const HorizontalTvList({
    super.key,
    required this.title,
    this.onSeeAllClick,
    required this.tvList,
    this.horizontalPadding,
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
          height: 72,
          child: ListView.builder(
            itemCount: tvList.length,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HorizontalTvListTile(
                tv: tvList[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
