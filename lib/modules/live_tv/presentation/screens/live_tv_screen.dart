import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/scaffold_with_appbar_and_category_tab.dart';
import '../../../../core/widgets/tabs/category_tab.dart';
import '../../../../core/widgets/title_and_filter_button.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';
import '../widgets/live_tv_cover.dart';
import '../widgets/live_tv_filter_button.dart';
import '../widgets/live_tv_filter_dialog.dart';
import '../widgets/live_tv_list_tile.dart';

class LiveTvScreen extends ConsumerStatefulWidget {
  const LiveTvScreen({super.key});

  @override
  ConsumerState createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends ConsumerState<LiveTvScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppbarAndCategoryTab(
      appBarTitle: 'Live TV',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.paddingNormal,
        ),
        child: Column(
          children: [
            const LiveTvCover(),
            const SizedBox(height: AppValues.paddingNormal + 4),
            TitleAndFilterButton(
              title: 'Live TV',
              buttonText: 'Filters',
              onFilterButtonTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return LiveTvFilterDialog(
                      onCategorySelect: () {},
                      onCountrySelect: () {},
                    );
                  },
                );
              },
            ),
            const SizedBox(height: AppValues.paddingNormal + 4),
            ListView.builder(
              itemCount: tvList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LiveTvListTile(
                  liveTv: tvList[index],
                  onTap: () {
                    AppNav.goRouter.push(
                      RouteNames.homeScreen + RouteNames.liveTvDetailScreen,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
