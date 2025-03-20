import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/widgets/appbars/main_shell_app_bar.dart';
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
      appBar: MainShellAppBar(
        onSearchIconTap: () {
          log('search');
        },
        onBellIconTap: () {
          log('notification bell');
        },
      ),
      body: widget.child,
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       title: Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Image.asset(
      //             'assets/icons/app_icons/vizo.png',
      //             height: 31,
      //             width: 31,
      //             fit: BoxFit.contain,
      //           ),
      //           const Expanded(child: SizedBox()),
      //         ],
      //       ),
      //       floating: true, // Shows the app bar when scrolling up
      //       snap: true, // Ensures it appears instantly
      //       backgroundColor: AppColors.scaffoldBlack,
      //       elevation: 5,
      //       actions: [
      //         InkResponse(
      //           onTap: () {},
      //           child: const ImageIcon(
      //             size: 22,
      //             AssetImage('assets/icons/basic_icons/search.png'),
      //           ),
      //         ),
      //         const SizedBox(width: 24), // Adjust spacing as needed
      //         InkResponse(
      //           onTap: () {},
      //           child: const ImageIcon(
      //             size: 20,
      //             AssetImage('assets/icons/basic_icons/notification_bell.png'),
      //           ),
      //         ),
      //         const SizedBox(width: 12),
      //       ],
      //     ),
      //     SliverToBoxAdapter(
      //       child: widget.child,
      //     ),
      //   ],
      // ),
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
