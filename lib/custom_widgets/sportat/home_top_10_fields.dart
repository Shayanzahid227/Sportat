import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_top_10_fields_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTop10Fields extends StatelessWidget {
  HomeTop10FieldsModel Object_top10Field;
  CustomTop10Fields({
    required this.Object_top10Field,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomLeft,
      width: MediaQuery.of(context).size.width * 0.9,
      height: 130.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${Object_top10Field.imageUrl}'),
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              15.w.horizontalSpace,
              CircleAvatar(
                backgroundImage: AssetImage(
                  '${Object_top10Field.fieldLogo}',
                ),
                radius: 25,
              ),
              10.horizontalSpace,
              Text(
                "${Object_top10Field.title}",
                style: style16B.copyWith(color: whitecolor),
              ),
            ],
          ),
          10.h.verticalSpace
        ],
      ),
    );
  }
}
