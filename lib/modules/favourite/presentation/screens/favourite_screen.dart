import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/main_shell_app_bar.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
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
        child: Text('Favourite'),
      ),
    );
  }
}
