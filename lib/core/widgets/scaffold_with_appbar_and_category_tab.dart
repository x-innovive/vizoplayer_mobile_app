import 'package:flutter/material.dart';

import 'appbars/app_app_bar.dart';

class ScaffoldWithAppbarAndCategoryTab extends StatelessWidget {
  final String appBarTitle;

  const ScaffoldWithAppbarAndCategoryTab({super.key, required this.appBarTitle,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: appBarTitle),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
