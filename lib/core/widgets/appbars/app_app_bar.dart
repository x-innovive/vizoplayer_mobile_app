import 'package:flutter/material.dart';

import '../../../infrastructure/navigation/app_nav.dart';
import '../../resources/app_values.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onSearchIconTap;
  final Function()? onBellIconTap;
  final Function()? onBackPressed;

  const AppAppBar({
    super.key,
    required this.title,
    this.onSearchIconTap,
    this.onBellIconTap,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56); // Set height of the AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkResponse(
            onTap: onBackPressed ?? () {
              AppNav.goRouter.pop();
            },
            child: Container(
              child: Image.asset(
                'assets/icons/basic_icons/arrow_back.png',
                height: 31,
                width: 31,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: AppValues.paddingNormal - 4),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      actions: [
        InkResponse(
          onTap: onSearchIconTap,
          child: const ImageIcon(
            size: 22,
            AssetImage('assets/icons/basic_icons/search.png'),
          ),
        ),
        const SizedBox(width: 24), // Adjust spacing as needed
        InkResponse(
          onTap: onBellIconTap,
          child: const ImageIcon(
            size: 20,
            AssetImage('assets/icons/basic_icons/notification_bell.png'),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
