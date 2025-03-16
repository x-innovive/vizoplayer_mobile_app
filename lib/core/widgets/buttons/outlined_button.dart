import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';

class BorderedButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BorderedButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.filledColor,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: AppValues.paddingNormal,
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
        ),
        splashFactory: InkRipple.splashFactory,
        overlayColor: Colors.white,
        side: const BorderSide(
          color: AppColors.borderColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
