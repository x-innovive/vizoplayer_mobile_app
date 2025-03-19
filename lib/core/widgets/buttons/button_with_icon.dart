import 'package:flutter/material.dart';

import 'base_button.dart';

class ButtonWithIcon extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Widget icon;
  final Color color;
  final Color contentColor;

  const ButtonWithIcon(
      {super.key,
      this.onTap,
      required this.title,
      required this.icon,
      required this.color,
      required this.contentColor});

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      color: color,
      onTap: onTap,
      // textColor: contentColor,
      verticalPadding: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          Text(title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),),
        ],
      ),
    );
  }
}
