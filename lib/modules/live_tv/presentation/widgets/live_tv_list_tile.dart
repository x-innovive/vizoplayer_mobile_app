import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';

class LiveTvListTile extends StatelessWidget {
  final String liveTv;

  const LiveTvListTile({super.key, required this.liveTv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.paddingNormal),
      margin: const EdgeInsets.only(bottom: AppValues.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.dropDownBackground,
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              liveTv,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppValues.paddingSmall),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '317',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                'Channel Name',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
