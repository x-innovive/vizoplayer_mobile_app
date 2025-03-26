import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  final String title;
  final Function()? onSeeAllTap;
  final bool? hideSeeAllButton;

  const TitleAndSeeAll({
    super.key,
    required this.title,
    required this.onSeeAllTap,
    this.hideSeeAllButton,
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
        Visibility(
          visible: hideSeeAllButton != false,
          child: InkWell(
            onTap: onSeeAllTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              color: Colors.transparent,
              child: const Row(
                children: [
                  Text('See All'),
                  SizedBox(width: 4),
                  ImageIcon(
                    AssetImage('assets/icons/basic_icons/arrow_right.png'),
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
