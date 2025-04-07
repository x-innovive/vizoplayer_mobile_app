import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';

class LiveTvFilterButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const LiveTvFilterButton({super.key,required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.paddingSmall + 4,
          vertical: 4,
        ),
        decoration: BoxDecoration(
            color: AppColors.filledColor,
            borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
            border: Border.all(
              color: AppColors.dividerColor,
              width: 1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
