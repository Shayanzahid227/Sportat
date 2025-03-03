// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  Color? backgroundColor;
  Color? surfaceTintColor;
  Color? shadowColor;
  Color? foregroundColor;
  CustomAppBar(
      {required this.title,
      this.backgroundColor,
      this.surfaceTintColor,
      this.shadowColor,
      this.foregroundColor});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? backGroundColor,
      surfaceTintColor: surfaceTintColor ?? backGroundColor,
      shadowColor: shadowColor ?? backGroundColor,
      foregroundColor: foregroundColor ?? backGroundColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomBackButton(),
      ),
      centerTitle: true,
      title: Text(
        "$title",
        style: style25B.copyWith(
          fontWeight: FontWeight.w500,
          color: lightGreyColor,
        ),
      ),
    );
  }
}
