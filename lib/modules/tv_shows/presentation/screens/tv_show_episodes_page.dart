import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';
import '../widgets/tv_show_episode_list_tile.dart';

class TvShowEpisodesPage extends StatelessWidget {
  const TvShowEpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppValues.paddingSmall),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
          child: DropdownButtonHideUnderline(
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.dropDownBackground,
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String?>(
                isDense: true,
                value: 'Episode 1',
                items: ['Episode 1', 'Episode 2', 'Episode 3'].map((e) {
                  return DropdownMenuItem<String?>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (v) {},
              ),
            ),
          ),
        ),
        const SizedBox(height: AppValues.paddingSmall),
        const PrimaryDivider(),
        const SizedBox(height: AppValues.paddingNormal),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const TvShowEpisodeListTile();
          },
        ),
      ],
    );
  }
}
