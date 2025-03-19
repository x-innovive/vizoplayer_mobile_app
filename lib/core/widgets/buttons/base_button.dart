import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';

class BaseButton extends StatelessWidget {
  final Color color;
  final Function()? onTap;
  final Widget child;
  final Color? textColor;
  final double? verticalPadding;

  const BaseButton({
    super.key,
    required this.color,
    this.onTap,
    required this.child,
    this.textColor,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 14,
          horizontal: AppValues.paddingNormal,
        ),
        textStyle: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
        ),
        splashFactory: InkRipple.splashFactory,
        overlayColor: AppColors.backgroundDark,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
