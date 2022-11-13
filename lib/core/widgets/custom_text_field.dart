import 'package:flutter/material.dart';

import '../constants/color/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.hintStyle,
      required this.prefixIcon,
      this.inputType,
      this.onSaved,
      this.onChanged,
      this.maxLines,
      this.validator,
      this.controller,
      required this.obscureText});
  final TextInputType? inputType;

  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final TextStyle? hintStyle;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            filled: true,
            fillColor: AppColor.kFieldFillColor,
            prefixIcon: Icon(
              prefixIcon,
              color: AppColor.kAppBarColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.kAppBarColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.kAppBarColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.kAppBarColor),
            ),
            errorStyle: const TextStyle(color: AppColor.kAppBarColor)),
      ),
    );
  }
}
