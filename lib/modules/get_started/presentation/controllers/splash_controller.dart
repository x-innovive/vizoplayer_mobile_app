import 'package:flutter/material.dart';
import 'package:vizoplayer/infrastructure/navigation/app_navigator.dart';
import 'package:vizoplayer/infrastructure/navigation/route_names.dart';

class SplashController {
  final BuildContext context;

  const SplashController({required this.context});

  Future<void> checkLoginState() async {
    await Future.delayed(const Duration(seconds: 3));
    AppNav.goRouter.go(RouteNames.getStartedScreen);
  }
}