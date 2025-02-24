// ignore_for_file: must_be_immutable

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_top_10_fields_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTop10Fields extends StatelessWidget {
  HomeTop10FieldsModel top10Field;
  CustomTop10Fields({
    required this.top10Field,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        height: 130.h,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${top10Field.imageUrl}'),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            15.w.horizontalSpace,
            CircleAvatar(
              backgroundImage: AssetImage(
                '${top10Field.fieldLogo}',
              ),
              radius: 25,
            ),
            10.horizontalSpace,
            Text(
              "${top10Field.title}",
              style: style16B.copyWith(color: whitecolor),
            ),
          ],
        ));
  }
}
