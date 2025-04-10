import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';
import 'base_button.dart';

class RedButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Function() onTap;

  const RedButton({
    super.key,
    required this.title,
    this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      color: bgColor ?? AppColors.red,
      onTap: onTap,
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
