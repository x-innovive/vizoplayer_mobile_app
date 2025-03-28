import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/button_with_icon.dart';

class LiveTvCover extends StatelessWidget {
  final Function()? onPlayTap;
  final Function()? onFavTap;

  const LiveTvCover({
    super.key,
    this.onPlayTap,
    this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: Column(
        children: [
          Image.asset(
            height: 254,
            'assets/temps/tvs/bbc_cover.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.paddingNormal,
              vertical: AppValues.paddingNormal,
            ),
            decoration: const BoxDecoration(
              color: AppColors.dividerColor,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'BBC News',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppValues.paddingNormal),
                const Text(
                  'he British Broadcasting Corporation is a British public service broadcaster.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppValues.paddingNormal),
                Row(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
