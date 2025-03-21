import 'package:flutter/material.dart';

class InvalidDataWidget extends StatelessWidget {
  final String message;
  const InvalidDataWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
