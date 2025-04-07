import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';
import '../../../../infrastructure/navigation/app_nav.dart';

class LiveTvFilterDialog extends StatelessWidget {
  final Function()? onCategorySelect;
  final Function()? onCountrySelect;

  const LiveTvFilterDialog({
    super.key,
    this.onCategorySelect,
    this.onCountrySelect,
  });

  final tabList = const ['Category', 'Country'];

  final liveTvCategories = const [
    "News",
    "Sports",
    "Movies",
    "Music",
    "Kids",
    "Documentary",
    "Lifestyle",
    "Comedy",
    "Religious",
    "Entertainment"
  ];

  final countries = const [
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
    "Germany",
    "France",
    "India",
    "Brazil",
    "Japan",
    "South Africa"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingNormal,
          vertical: MediaQuery.of(context).size.height / 7,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                InkResponse(
                  onTap: () {
                    AppNav.goRouter.pop();
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .15),
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: const Icon(
                      CupertinoIcons.multiply,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppValues.paddingNormal),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBlack,
                  borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: AppValues.paddingSmall),
                      TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 15,
                        ),
                        tabs: tabList.map(
                          (e) {
                            return Tab(
                              // text: e,
                              height: 33,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppValues.paddingNormal,
                                ),
                                child: Text(e),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      const SizedBox(height: AppValues.paddingSmall),
                      const PrimaryDivider(),
                      Expanded(
                        child: TabBarView(
                          children: [
                            CategoryValueList(
                              values: liveTvCategories,
                              onItemSelect: (v) {
                                AppNav.goRouter.pop();
                              },
                            ),
                            CategoryValueList(
                              values: countries,
                              onItemSelect: (v) {
                                AppNav.goRouter.pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryValueList extends StatelessWidget {
  final List<String> values;
  final Function(String) onItemSelect;

  const CategoryValueList({super.key, required this.values, required this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: values.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onItemSelect(values[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.paddingLarge,
                vertical: AppValues.paddingNormal,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                values[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
