import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../infrastructure/navigation/app_nav.dart';

class TvGuideDatePicker extends StatelessWidget {
  final Function(DateTime?) onPickedDate;

  const TvGuideDatePicker({
    super.key,
    required this.onPickedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingNormal,
          vertical: MediaQuery.of(context).size.height / 5,
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
                child: SfDateRangePicker(
                  backgroundColor: AppColors.scaffoldBlack,
                  allowViewNavigation: false,
                  enablePastDates: false,
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: AppColors.scaffoldBlack,
                    textAlign: TextAlign.center,
                  ),
                  selectionColor: AppColors.red,
                  selectionRadius: 2,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  showActionButtons: true,
                  selectionMode: DateRangePickerSelectionMode.single,
                  todayHighlightColor: AppColors.red,
                  showTodayButton: false,
                  showNavigationArrow: true,
                  onCancel: () {
                    AppNav.goRouter.pop();
                  },
                  onSubmit: (date) {
                    onPickedDate(date as DateTime?);
                    AppNav.goRouter.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
