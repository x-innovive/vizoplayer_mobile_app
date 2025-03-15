import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Image.asset(
            'assets/icons/app_icons/vizo_player.png',
          ),
        ),
      ),
    );
  }
}
