import 'package:flutter/material.dart';

class MainShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onSearchIconTap;
  final Function()? onBellIconTap;

  const MainShellAppBar({
    super.key,
    this.onSearchIconTap,
    this.onBellIconTap,
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
          Image.asset(
            'assets/icons/app_icons/vizo.png',
            height: 31,
            width: 31,
            fit: BoxFit.contain,
          ),
          const Expanded(child: SizedBox()),
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
