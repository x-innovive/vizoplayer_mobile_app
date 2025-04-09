import 'dart:developer' as dev;

extension StringExtension on String {
  void log({String? tag}) => dev.log((tag ?? "STRING -> ") + this);
}