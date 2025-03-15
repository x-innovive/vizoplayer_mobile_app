import 'package:flutter/material.dart';
import 'package:vizoplayer/core/resources/app_values.dart';

class AppIconAppBar extends StatelessWidget {
  final bool fullIcon;
  final Function()? onBackPressed;

  const AppIconAppBar({super.key, required this.fullIcon, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.paddingNormal,
      ),
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: !fullIcon
          ? Image.asset(
              height: 30,
              width: 30,
              'assets/icons/app_icons/vizo.png',
            )
          : Row(
              children: [
                InkResponse(
                  onTap: onBackPressed,
                  child: Image.asset(
                    height: 23,
                    'assets/icons/basic_icons/arrow_back.png',
                  ),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  height: 31,
                  'assets/icons/app_icons/vizo_player.png',
                ),
              ],
            ),
    );
  }
}
