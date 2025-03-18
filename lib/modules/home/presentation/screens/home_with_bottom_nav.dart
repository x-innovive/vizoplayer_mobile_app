import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';
import '../providers/home_providers.dart';

class HomeWithBottomNav extends ConsumerStatefulWidget {
  final Widget child;

  const HomeWithBottomNav({super.key, required this.child});

  @override
  ConsumerState<HomeWithBottomNav> createState() => _HomeWithBottomNavState();
}

class _HomeWithBottomNavState extends ConsumerState<HomeWithBottomNav> {

  void _onItemTapped(int index) {
    final selectedIndex = ref.read(provBottomNvSelectedIndex);
    if (selectedIndex != index) {
      switch (index) {
        case 0:
          AppNav.goRouter.go(RouteNames.homeScreen);
        case 1:
          AppNav.goRouter.go(RouteNames.fireScreen);
        case 2:
          AppNav.goRouter.go(RouteNames.favouriteScreen);
        case 3:
          AppNav.goRouter.go(RouteNames.profileScreen);
      }
    }
    ref.read(provBottomNvSelectedIndex.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(provBottomNvSelectedIndex);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        iconSize: 22.11,
        selectedItemColor: AppColors.red,
        unselectedItemColor: const Color(0xFF7A7F88),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage('assets/icons/nav_icons/home.png')),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/nav_icons/fire.png')),
            label: "Fire",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/nav_icons/favourite.png')),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/nav_icons/user.png')),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
