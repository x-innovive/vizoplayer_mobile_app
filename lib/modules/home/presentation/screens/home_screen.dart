import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: 31,
              width: 31,
              'assets/icons/app_icons/vizo.png',
              fit: BoxFit.contain,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        actions: [
          InkResponse(
            onTap: () {},
            child: const ImageIcon(
              size: 22,
              AssetImage(
                'assets/icons/basic_icons/search.png',
              ),
            ),
          ),
          const SizedBox(width: AppValues.paddingNormal + 4),
          InkResponse(
            onTap: () {},
            child: const ImageIcon(
              size: 20,
              AssetImage(
                'assets/icons/basic_icons/notification_bell.png',
              ),
            ),
          ),
          const SizedBox(width: AppValues.paddingNormal + 4),
        ],
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
