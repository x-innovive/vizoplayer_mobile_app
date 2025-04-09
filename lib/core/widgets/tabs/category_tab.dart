import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../infrastructure/navigation/app_nav.dart';
import '../../../infrastructure/navigation/route_names.dart';
import '../../extentions/string_extension.dart';
import '../../resources/app_values.dart';

class CategoryTab extends StatelessWidget {
  // final Function(String)? onCategoryTap;
  const CategoryTab({
    super.key,
    /*this.onCategoryTap*/
  });

  final categoryList = const ['Movies', 'TV Shows', 'Video Club', 'Live TV', 'Audio'];
  final othersCategoryList = const ['Live TV', 'Audio'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: categoryList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final e = categoryList[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? AppValues.paddingNormal : 0,
                    right: AppValues.paddingSmall,
                  ),
                  child: InkWell(
                    onTap: () {
                      e.toString().log();

                      switch (e) {
                        case 'Movies':
                        case 'Video Club':
                          AppNav.goRouter.push(
                            RouteNames.homeScreen + RouteNames.moviesScreen,
                            extra: e,
                          );
                        case 'TV Shows':
                          AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.tvShowsScreen);
                        case 'Live TV':
                          AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.liveTvScreen);
                        case 'Audio':
                          AppNav.goRouter.push(RouteNames.homeScreen + RouteNames.audioScreen);
                      }
                    },
                    borderRadius: BorderRadius.circular(AppValues.borderRadiusMedium),
                    child: _container(
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Color(0xFFCACACA),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: AppValues.paddingNormal),
              child: _container(
                // child: const Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'All',
                //       style: TextStyle(
                //         color: Color(0xFFCACACA),
                //       ),
                //     ),
                //     SizedBox(width: 4),
                //     Icon(
                //       size: 20,
                //       Icons.keyboard_arrow_down_outlined,
                //     ),
                //   ],
                // ),
                usePadding: false,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String?>(
                    value: null,
                    alignment: Alignment.center,
                    isExpanded: false,
                    isDense: false,
                    style: const TextStyle(
                      color: Color(0xFFCACACA),
                    ),
                    hint: const Text(
                      'All',
                      style: TextStyle(
                        color: Color(0xFFCACACA),
                      ),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(
                        size: 20,
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ),
                    items: othersCategoryList.map((oe) {
                      return DropdownMenuItem<String?>(
                        value: oe,
                        child: Text(
                          oe,
                          style: const TextStyle(
                            color: Color(0xFFCACACA),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (v) {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _container({required Widget child, bool? usePadding}) {
    return Container(
      padding: usePadding != false ? const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusMedium),
        border: Border.all(
          width: 1,
          color: const Color(0xFF989899),
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
