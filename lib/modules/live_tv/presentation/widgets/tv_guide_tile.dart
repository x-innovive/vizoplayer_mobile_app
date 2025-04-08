import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';

class TvGuideTile extends StatelessWidget {
  final bool isSelected;

  const TvGuideTile({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.paddingNormal,
      ),
      margin: const EdgeInsets.only(bottom: AppValues.paddingSmall),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.red : const Color(0xFF414141),
        borderRadius: BorderRadius.circular(
          AppValues.borderRadiusSmall,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.paddingSmall,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : const Color(0xFF262626),
              borderRadius: BorderRadius.circular(
                AppValues.borderRadiusSmall,
              ),
              border: isSelected ? null : Border.all(
                color: AppColors.dropDownBackground,
                width: 1,
              ),
            ),
            child: Text(
              '12:00 AM',
              style: TextStyle(fontSize: 13, color: isSelected ? Colors.black : Colors.white),
            ),
          ),
          const SizedBox(height: AppValues.paddingSmall - 2),
          const Text('Dave Gorman: Modern Life Is Goodish'),
        ],
      ),
    );
  }
}
