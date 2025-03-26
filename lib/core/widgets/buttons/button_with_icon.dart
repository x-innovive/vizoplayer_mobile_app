import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class ButtonWithIcon extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function()? onTap;
  final Color? childColor;
  final Color? bgColor;

  const ButtonWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.childColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: Container(
        height: 34,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          // vertical: 6,
          horizontal: AppValues.paddingNormal,
        ),
        decoration: BoxDecoration(
          color: bgColor ?? const Color(0xFF515151),
          borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 3),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: childColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
