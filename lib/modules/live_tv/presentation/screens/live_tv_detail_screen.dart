import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extentions/string_extension.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/title_and_filter_button.dart';
import '../../../movie/presentation/widgets/chewie_movie_player.dart';
import '../widgets/live_tv_description_widget.dart';
import '../widgets/tv_guide_date_picker.dart';
import '../widgets/tv_guide_tile.dart';

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
                  const LiveTvDescriptionWidget(),
                  // const SizedBox(height: AppValues.paddingNormal),
                  // PrimaryDivider(),
                  // const SizedBox(height: AppValues.paddingNormal + 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.paddingNormal,
                    ),
                    child: TitleAndFilterButton(
                      title: 'TV Guide',
                      buttonText: 'Thu 9 September',
                      onFilterButtonTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return TvGuideDatePicker(
                              onPickedDate: (pickedDate) {
                                pickedDate?.toString().log();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(AppValues.paddingNormal),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TvGuideTile(isSelected: index == 3);
                    },
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
