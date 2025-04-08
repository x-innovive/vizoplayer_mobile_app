import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/button_with_icon.dart';
import '../../../../core/widgets/buttons/circle_icon_button.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';

class LiveTvDescriptionWidget extends StatelessWidget {
  const LiveTvDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(
            AppValues.paddingNormal,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/temps/tvs/1.png',
                  height: 56,
                  width: 56,
                ),
              ),
              const SizedBox(width: AppValues.paddingNormal),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Star Plus',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: AppValues.paddingSmall),
                    RichText(
                      text: const TextSpan(
                        text: 'Now Broadcasting:',
                        style: TextStyle(color: AppColors.red),
                        children: [
                          TextSpan(
                            text: " Men's Asian latest Champions Trophy 2024 HLs",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppValues.paddingNormal),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWithIcon(
                            title: 'My List',
                            icon: Image.asset(
                              'assets/icons/basic_icons/love.png',
                              height: 16,
                              width: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppValues.paddingSmall + 2),
                        CircleIconButton(
                          onTap: () {},
                          icon: Image.asset(
                            'assets/icons/basic_icons/thumbsup.png',
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const PrimaryDivider(),
        Padding(
          padding: const EdgeInsets.all(
            AppValues.paddingNormal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Program",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppValues.paddingNormal),
              RichText(
                text: const TextSpan(
                  text: "05:30 AM - ",
                  style: TextStyle(
                    color: AppColors.subtitleColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'UCL 2024/25 HLs',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppValues.paddingSmall),
              RichText(
                text: const TextSpan(
                  text: "06:30 AM - ",
                  style: TextStyle(
                    color: AppColors.subtitleColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'WWE NXT',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppValues.paddingSmall),
              RichText(
                text: const TextSpan(
                  text: "08:30 AM - ",
                  style: TextStyle(
                    color: AppColors.subtitleColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Men's Asian Champions Trophy 2024 HLs",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppValues.paddingSmall),
              RichText(
                text: const TextSpan(
                  text: "09:30 AM - ",
                  style: TextStyle(
                    color: AppColors.subtitleColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'UCL 2024/25 HLs',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppValues.paddingSmall),
              RichText(
                text: const TextSpan(
                  text: "10:30 AM - ",
                  style: TextStyle(
                    color: AppColors.subtitleColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'UCL 2024/25 HLs',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppValues.paddingSmall),
            ],
          ),
        ),
      ],
    );
  }
}
