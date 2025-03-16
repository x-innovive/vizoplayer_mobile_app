import 'package:flutter/material.dart';

import '../../../infrastructure/navigation/app_nav.dart';
import '../../resources/app_values.dart';
import '../buttons/outlined_button.dart';
import '../buttons/red_button.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  String? title,
  required String message,
}) async {
  final result = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            title ?? 'Are you sure?',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingSmall),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.only(
          top: AppValues.paddingNormal - 4,
          bottom: AppValues.paddingNormal,
          right: AppValues.paddingNormal,
          left: AppValues.paddingNormal,
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: AppValues.paddingNormal,
          vertical: AppValues.paddingNormal,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: BorderedButton(
                  title: 'Cancel',
                  onTap: () {
                    AppNav.goRouter.pop(false);
                  },
                ),
              ),
              const SizedBox(width: AppValues.paddingNormal),
              Expanded(
                child: RedButton(
                  title: 'Ok',
                  onTap: () {
                    AppNav.goRouter.pop(true);
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );

  return result ?? false;
}
