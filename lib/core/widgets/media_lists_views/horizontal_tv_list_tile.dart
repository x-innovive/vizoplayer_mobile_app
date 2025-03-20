import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class HorizontalTvListTile extends StatelessWidget {
  final String tv;
  final Function()? onTap;

  const HorizontalTvListTile({
    super.key,
    required this.tv,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(72),
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                tv,
                height: 72,
                width: 72,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
