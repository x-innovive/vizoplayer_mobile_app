import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';
import 'package:go_router/go_router.dart';

class SplashController {
  final BuildContext context;

  const SplashController({required this.context});

  Future<void> checkLoginState() async {
    await Future.delayed(const Duration(seconds: 3));
    AppNav.goRouter.go(RouteNames.getStartedScreen);
  }
}