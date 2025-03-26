import 'package:flutter/material.dart';

class TitleValue extends StatelessWidget {
  final String title;
  final String value;

  const TitleValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            color: Color(0xFFCACACA),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFFFBFFFF),
            ),
          ),
        ),
      ],
    );
  }
}
