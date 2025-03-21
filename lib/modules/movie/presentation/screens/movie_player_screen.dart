import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/app_app_bar.dart';

class MoviePlayerScreen extends ConsumerStatefulWidget {
  const MoviePlayerScreen({super.key});

  @override
  ConsumerState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MoviePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(title: ''),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
