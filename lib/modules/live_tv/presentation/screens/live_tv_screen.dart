import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
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
    return Scaffold(
      appBar: const AppAppBar(title: 'Live TV'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppValues.paddingNormal),
          child: Column(
            children: [
              const LiveTvCover(),
              const SizedBox(height: AppValues.paddingNormal + 4),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Live TV',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  LiveTvFilterButton(
                    title: 'Filters',
                    onTap: () async {
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
                ],
              ),
              const SizedBox(height: AppValues.paddingNormal + 4),
              ListView.builder(
                itemCount: tvList.length,
                shrinkWrap: true,
                primary: false,
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
      ),
    );
  }
}
