import 'package:flutter/material.dart';

class RichTitleValue extends StatelessWidget {
  final String title;
  final String value;

  const RichTitleValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title:',
        style: const TextStyle(
          color: Color(0xFFCACACA),
        ),
        children: [
          TextSpan(text: ' $value', style: const TextStyle(
            color: Color(0xFFFBFFFF),
          ),)
        ],
      ),
    );
  }
}
