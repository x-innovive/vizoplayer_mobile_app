import 'package:flutter/material.dart';

import '../../resources/app_values.dart';

class CategoryTab extends StatelessWidget {
  final Function()? onCategoryTap;
  const CategoryTab({super.key, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...['Movies', 'TV Shows', 'Video Club'].map((e) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: onCategoryTap,
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
          }),
          _container(
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    color: Color(0xFFCACACA),
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  size: 20,
                  Icons.keyboard_arrow_down_outlined,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _container({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusMedium),
        border: Border.all(
          width: 1,
          color: const Color(0xFF989899),
        ),
      ),
      child: child,
    );
  }
}
