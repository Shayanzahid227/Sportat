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
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: AssetImage('${top10Field.imageUrl}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                '${top10Field.fieldLogo}',
              ),
              radius: 25.r,
            ),
            10.horizontalSpace,
            Text(
              "${top10Field.title}",
              style: style16B.copyWith(color: whiteColor),
            ),
          ],
        ));
  }
}
