import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/scaffold_with_appbar_and_category_tab.dart';

class AudioScreen extends ConsumerStatefulWidget {
  const AudioScreen({super.key});

  @override
  ConsumerState createState() => _AudioScreenState();
}

class _AudioScreenState extends ConsumerState<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppbarAndCategoryTab(
      appBarTitle: 'Audio',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
