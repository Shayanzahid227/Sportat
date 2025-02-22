import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLineWithText extends StatelessWidget {
  final String text;
  final double lineWidth; // New parameter to set line width

  const CustomLineWithText({
    super.key,
    required this.text,
    this.lineWidth = 50.0, // Default line width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0), // Adjust padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          Container(
            width: 110.w, // Set the width of the line
            height: 1.0,
            color: Colors.grey, // Line color
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Space around the text
            child: Text(
              text,
              style: style14.copyWith(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ),
          Container(
            width: 110.w, // Set the width of the line
            height: 1.0,
            color: Colors.grey, // Line color
          ),
        ],
      ),
    );
  }
}
