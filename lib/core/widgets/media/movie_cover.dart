import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';
import '../buttons/button_with_icon.dart';

class MovieCover extends StatelessWidget {
  final String assetPath;

  const MovieCover({super.key, required this.assetPath});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...['16+', 'HD', 'Duration: 50m'].map((e) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
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
          ),
          const SizedBox(height: AppValues.paddingNormal),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('violence'),
              const SizedBox(width: 8),
              Icon(
                Icons.circle,
                size: 4,
              ),
              const SizedBox(width: 8),
              Text('violence'),
            ],
          ),
          const SizedBox(height: AppValues.paddingNormal - 4),
          const Row(
            children: [
              ButtonWithIcon(
                title: 'Play',
                icon: Icon(Icons.play_arrow),
                color: Colors.white,
                contentColor: Colors.black,
              ),

              ButtonWithIcon(
                title: 'My List',
                icon: Icon(Icons.favorite_border),
                color: Colors.blue,
                contentColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: AppValues.paddingNormal),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 3) * 1.9,
            child: Row(
              children: [
                Expanded(
                  child: ButtonWithIcon(
                    title: 'Play',
                    onTap: () {},
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
                    onTap: () {},
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
