import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class NoteText extends StatelessWidget {
  const NoteText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'Note: ',
          style: TextStyle(
            color: AppColors.deepOrange,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: 'This is an OTT player that streams videos from sources provided by the customer. We are not responsible for the content supplied by third-party sources.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ]
      ),
    );
  }
}
