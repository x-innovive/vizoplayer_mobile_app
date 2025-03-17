import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favourite'),
      ),
    );
  }
}
