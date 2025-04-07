import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/buttons/button_with_icon.dart';
import '../../../../core/widgets/buttons/circle_icon_button.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';
import '../../../movie/presentation/widgets/chewie_movie_player.dart';

class LiveTvDetailsScreen extends ConsumerStatefulWidget {
  const LiveTvDetailsScreen({super.key});

  @override
  ConsumerState createState() => _LiveTvDetailsScreenState();
}

class _LiveTvDetailsScreenState extends ConsumerState<LiveTvDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: ''),
      body: Column(
        children: [
          const ChewieMoviePlayer(
            url:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          ),
          const SizedBox(height: AppValues.paddingNormal),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                  // const SizedBox(height: AppValues.paddingNormal),
                  const PrimaryDivider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
