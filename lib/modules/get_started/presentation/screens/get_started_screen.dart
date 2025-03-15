import 'package:flutter/material.dart';
import 'package:vizoplayer/core/widgets/buttons/red_button.dart';
import 'package:vizoplayer/infrastructure/navigation/app_navigator.dart';
import 'package:vizoplayer/infrastructure/navigation/route_names.dart';
import 'package:vizoplayer/modules/sign_in/presentation/widgets/app_icon_app_bar.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../resources/get_started_strings.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Image.asset(
                  width: MediaQuery.of(context).size.width,
                  'assets/images/diagonal_background_img.png',
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).padding.top + AppValues.paddingNormal,
                  child: const AppIconAppBar(fullIcon: false),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.backgroundDark.withValues(alpha: .1),
                          AppColors.backgroundDark.withValues(alpha: .3),
                          AppColors.backgroundDark.withValues(alpha: .5),
                          AppColors.backgroundDark.withValues(alpha: .7),
                          AppColors.backgroundDark.withValues(alpha: .9),
                          AppColors.backgroundDark,
                          AppColors.backgroundDark,
                          AppColors.backgroundDark,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.backgroundDark,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.paddingNormal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    GetStartedStrings.unlimitedFilms,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    GetStartedStrings.watchAnywhere,
                    style: TextStyle(
                      fontSize: AppValues.fontSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: RedButton(
                      title: 'Get Started',
                      onTap: () {
                        AppNav.goRouter.push(RouteNames.signInScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
