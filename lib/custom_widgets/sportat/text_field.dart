// ignore_for_file: use_key_in_widget_constructors, unused_field
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxline;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  final String? Function(String?)? validator;
  CustomTextFormFeild(
      {required this.text,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText,
      this.controller,
      this.onChanged,
      this.maxline = 1,
      this.validator});
  final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxline,
      decoration: authFieldDecoration.copyWith(
        fillColor: Colors.white,
        hintText: text,
        prefix: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle:
            style14.copyWith(fontWeight: FontWeight.w400, color: custardColor2),
      ),
      validator: validator,
    );
  }
}
