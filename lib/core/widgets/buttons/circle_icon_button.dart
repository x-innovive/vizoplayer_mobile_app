import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;

  const CircleIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          )
        ),
        child: icon,
      ),
    );
  }
}
