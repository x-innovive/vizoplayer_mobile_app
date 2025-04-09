import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/scaffold_with_appbar_and_category_tab.dart';
import '../../../../core/widgets/title_and_filter_button.dart';
import '../widgets/audio_album_cover.dart';

class AudioAlbumScreen extends ConsumerStatefulWidget {
  const AudioAlbumScreen({super.key});

  @override
  ConsumerState createState() => _AudioScreenState();
}

class _AudioScreenState extends ConsumerState<AudioAlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppbarAndCategoryTab(
      appBarTitle: 'Audio',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
        child: Column(
          children: [
            AudioAlbumCover(
              assetPath: 'assets/temps/movie_covers/timeless.png',
              onFavTap: () {},
              onPlayTap: () {},
            ),
            const SizedBox(height: AppValues.paddingNormal + 4),
            TitleAndFilterButton(
              title: "Audio",
              buttonText: 'Filters',
              onFilterButtonTap: () async {
                // await showDialog(context: context, builder: builder);
              },
            ),
            const SizedBox(height: AppValues.paddingNormal + 4),
          ],
        ),
      ),
    );
  }
}
