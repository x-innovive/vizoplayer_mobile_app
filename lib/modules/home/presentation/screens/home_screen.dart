import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/main_shell_app_bar.dart';
import '../../../../core/widgets/media/movie_cover.dart';
import '../../../../core/widgets/tabs/category_tab.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainShellAppBar(
        onSearchIconTap: () {},
        onBellIconTap: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: AppValues.paddingNormal),
            child: CategoryTab(
              onCategoryTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingNormal,
            ),
            child: Column(
              children: [
                MovieCover(assetPath: 'assets/temps/movie_covers/joker.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
