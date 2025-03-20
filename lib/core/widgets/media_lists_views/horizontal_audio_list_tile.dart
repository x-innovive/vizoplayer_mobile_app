import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class HorizontalAudioListTile extends StatelessWidget {
  final String audio;
  final Function()? onTap;

  const HorizontalAudioListTile({
    super.key,
    required this.audio,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 4,
        ),
        child: InkWell(
          onTap: onTap,
          child: Image.asset(
            audio,
            height: 160,
            width: 160,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
