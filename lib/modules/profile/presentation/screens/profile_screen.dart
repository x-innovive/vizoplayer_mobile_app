import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/main_shell_app_bar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
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
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
