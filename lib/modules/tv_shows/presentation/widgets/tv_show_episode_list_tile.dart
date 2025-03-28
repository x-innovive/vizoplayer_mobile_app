import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';

class TvShowEpisodeListTile extends StatelessWidget {
  const TvShowEpisodeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
          child: Column(
            children: [
              const SizedBox(height: AppValues.paddingNormal),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: [
                        Image.asset(
                          height: 64,
                          width: 115,
                          'assets/temps/tv_show/tv_show.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/icons/basic_icons/circle_play.png',
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppValues.paddingNormal),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Flexible(
                              child: Text(
                                '1. Episode',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppValues.paddingSmall),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppValues.paddingSmall - 2,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.dividerColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                '40m',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppValues.paddingSmall),
                        const Text(
                          'When the national mint and a touring school group are held hostage by robbers.',
                          style: TextStyle(color: AppColors.subtitleColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppValues.paddingNormal),
            ],
          ),
        ),
        const PrimaryDivider(),
      ],
    );
  }
}
