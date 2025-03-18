import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/home_app_bar.dart';
import '../../../../core/widgets/buttons/red_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onSearchIconTap: () {},
        onBellIconTap: () {},
      ),
      body: Center(
        child: RedButton(
          title: 'Nav',
          onTap: () {
            // AppNav.goRouter.go(RouteNames.homeScreen + RouteNames.detailsScreen);
          },
        ),
      ),
    );
  }
}
