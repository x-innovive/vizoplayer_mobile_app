import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/app_app_bar.dart';

class AudioScreen extends ConsumerStatefulWidget {
  const AudioScreen({super.key});

  @override
  ConsumerState createState() => _AudioScreenState();
}

class _AudioScreenState extends ConsumerState<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Audio'),
      body: SingleChildScrollView(
        child: ,
      ),
    );
  }
}
