import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/outlined_button.dart';
import '../../../../core/widgets/buttons/red_button.dart';
import '../../../../core/widgets/texts/contact_us_text.dart';
import '../widgets/app_icon_app_bar.dart';

class DeactivatedAccountScreen extends ConsumerStatefulWidget {
  const DeactivatedAccountScreen({super.key});

  @override
  ConsumerState createState() => _DeactivatedAccountScreenState();
}

class _DeactivatedAccountScreenState extends ConsumerState<DeactivatedAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + AppValues.paddingNormal,
          ),
          const AppIconAppBar(fullIcon: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppValues.paddingNormal),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingNormal,
                      ),
                      child: Text(
                        'Your account has been deactivated. Please contact your IPTV/OTT provider to resolve this issue.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.paddingNormal,
                        vertical: AppValues.paddingSmall + 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.filledColor,
                        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
                        border: Border.all(
                          width: 1,
                          color: AppColors.deepOrange,
                        ),
                      ),
                      child: const Text(
                        '12345678900',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppValues.paddingSmall + 2),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (val) {},
                                  side: const BorderSide(
                                    width: 1.5,
                                    color: AppColors.borderColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text('Active Code Activation'),
                            ],
                          ),
                        ),
                        const Text('c4:6e:7b:90:a0:22'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: BorderedButton(
                            title: 'Contact Us',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: AppValues.paddingNormal),
                        Expanded(
                          child: RedButton(
                            title: 'Activate',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const ContactUsText(),
          const SizedBox(height: AppValues.paddingLarge),
        ],
      ),
    );
  }
}
