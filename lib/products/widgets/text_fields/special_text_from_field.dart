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
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const SpecialTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: Padding(
            padding: EdgeInsets.only(left: context.sized.lowValue),
            child: prefixIcon),
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: context.border.highBorderRadius,
        ),
        fillColor: ColorName.placeboPurple,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: context.border.highBorderRadius,
        ),
      ),
    );
  }
}
