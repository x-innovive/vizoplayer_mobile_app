import 'package:flutter/material.dart';

import '../../modules/live_tv/presentation/widgets/live_tv_filter_button.dart';

class TitleAndFilterButton extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function() onFilterButtonTap;

  const TitleAndFilterButton({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onFilterButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        LiveTvFilterButton(
          title: 'Thu 9 September',
          onTap: onFilterButtonTap,
        ),
      ],
    );
  }
}
