import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../widgets/live_tv_cover.dart';
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
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.paddingSmall + 4,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.filledColor,
                          borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
                          border: Border.all(
                            color: AppColors.dividerColor,
                            width: 1,
                          )),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Filters'),
                          SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
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
