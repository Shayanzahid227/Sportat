// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20.sp,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
