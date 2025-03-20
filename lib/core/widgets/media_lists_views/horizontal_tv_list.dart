import 'package:flutter/material.dart';

import '../../resources/app_values.dart';
import 'horizontal_tv_list_tile.dart';
import 'title_and_see_all.dart';

class HorizontalTvList extends StatelessWidget {
  final String title;
  final Function()? onSeeAllClick;
  final List<String> tvList;

  const HorizontalTvList({
    super.key,
    required this.title,
    this.onSeeAllClick,
    required this.tvList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(
          title: title,
          onSeeAllTap: onSeeAllClick,
        ),
        const SizedBox(height: AppValues.paddingSmall),
        SizedBox(
          height: 72,
          child: ListView.builder(
            itemCount: tvList.length,
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
