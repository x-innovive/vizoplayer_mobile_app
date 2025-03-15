import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/get_started/presentation/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashController _controller;

  @override
  void initState() {

    _controller = SplashController(context: context);
    _controller.checkLoginState();

    super.initState();
  }

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
