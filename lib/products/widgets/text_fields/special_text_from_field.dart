import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../generation/index.dart';

class SpecialTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const SpecialTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: context.border.normalBorderRadius,
        ),
        fillColor: ColorName.placeboPurple,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: context.border.normalBorderRadius,
        ),
      ),
    );
  }
}
