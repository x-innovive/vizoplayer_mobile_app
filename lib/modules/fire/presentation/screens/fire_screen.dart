import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/main_shell_app_bar.dart';

class FireScreen extends ConsumerStatefulWidget {
  const FireScreen({super.key});

  @override
  ConsumerState createState() => _FireScreenState();
}

class _FireScreenState extends ConsumerState<FireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainShellAppBar(
        onSearchIconTap: () {
          log('search');
        },
        onBellIconTap: () {
          log('notification bell');
        },
      ),
    );
  }
}
