import 'package:flutter/material.dart';
import 'package:vizoplayer/infrastructure/navigation/app_navigator.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import 'app_icon_app_bar.dart';

class SignInScreenBackground extends StatelessWidget {
  final String title;
  final double padding;
  final Function() onBackPress;
  final Widget child;

  const SignInScreenBackground({
    super.key,
    required this.child,
    required this.title,
    required this.onBackPress,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Image.asset(
                width: MediaQuery.of(context).size.width,
                'assets/images/diagonal_background_img_small.png',
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                left: 0,
                top: MediaQuery.of(context).padding.top + AppValues.paddingNormal,
                child: AppIconAppBar(
                  fullIcon: true,
                  onBackPressed: () {
                    AppNav.goRouter.pop();
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // height: 60,
                  padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding + 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.backgroundDark.withValues(alpha: .3),
                        AppColors.backgroundDark.withValues(alpha: .6),
                        AppColors.backgroundDark.withValues(alpha: .9),
                        AppColors.backgroundDark,
                        AppColors.backgroundDark,
                        AppColors.backgroundDark,
                        AppColors.backgroundDark,
                      ],
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 11,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.backgroundDark,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
