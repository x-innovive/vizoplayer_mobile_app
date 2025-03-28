import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../widgets/live_tv_cover.dart';

class LiveTvScreen extends ConsumerStatefulWidget {
  const LiveTvScreen({super.key});

  @override
  ConsumerState createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends ConsumerState<LiveTvScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(title: 'Live TV'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(AppValues.paddingNormal),
          child: Column(
            children: [
              LiveTvCover(),
            ],
          ),
        ),
      ),
    );
  }
}
