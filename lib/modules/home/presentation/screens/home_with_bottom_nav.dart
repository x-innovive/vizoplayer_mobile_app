import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          AppNav.goRouter.go(RouteNames.favouriteScreen);
        case 2:
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
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
