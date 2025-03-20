import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/appbars/main_shell_app_bar.dart';

class HomeCategoryDetailsScreen extends ConsumerStatefulWidget {
  const HomeCategoryDetailsScreen({super.key});

  @override
  ConsumerState createState() => _HomeCategoryDetailsScreenState();
}

class _HomeCategoryDetailsScreenState extends ConsumerState<HomeCategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Movies'),
      body: Container(),
    );
  }
}
