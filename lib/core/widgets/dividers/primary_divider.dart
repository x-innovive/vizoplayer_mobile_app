import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class PrimaryDivider extends StatelessWidget {
  const PrimaryDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.dividerColor,
      height: 1,
    );
  }
}
