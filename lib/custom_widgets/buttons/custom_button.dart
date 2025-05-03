// ignore_for_file: unused_local_variable, must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? onPressed;
  Color? boxColor;
  Color? textColor;
  Color? border;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.boxColor,
    this.textColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: boxColor ?? primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(21),
          ),
          border: Border.all(color: border ?? primaryColor, width: 1.5),
        ),
        child: Text(
          "$text",
          style: style18.copyWith(color: textColor ?? whiteColor),
        ),
      ),
    );
  }
}
