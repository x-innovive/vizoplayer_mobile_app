import 'package:flutter/material.dart';

import 'appbars/app_app_bar.dart';
import 'tabs/category_tab.dart';

class ScaffoldWithAppbarAndCategoryTab extends StatelessWidget {
  final String appBarTitle;
  final Widget child;

  const ScaffoldWithAppbarAndCategoryTab({
    super.key,
    required this.appBarTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: appBarTitle),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 4),
            const CategoryTab(),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
