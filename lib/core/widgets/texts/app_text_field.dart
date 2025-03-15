import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    required this.hint,
    this.maxLines,
    this.onChange,
    this.onFieldSubmitted,
    this.onSave,
    this.validator,
    this.obscureText,
    this.focusNode,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;
  final int? maxLines;
  final Function(String?)? onSave;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.borderColor,
      ),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(
        color: Colors.white,
        fontSize: AppValues.fontMedium,
      ),
      maxLines: obscureText == true ? 1 : maxLines,
      validator: validator,
      onChanged: onChange,
      onSaved: onSave,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.filledColor,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white38,
          fontSize: AppValues.fontMedium,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppValues.paddingNormal,
          vertical: AppValues.paddingSmall - 2,
        ),
      ),
    );
  }
}
