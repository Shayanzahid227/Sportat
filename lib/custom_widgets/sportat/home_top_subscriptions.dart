// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_top_subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopSubscriptions extends StatelessWidget {
  HomeTopSubscriptionsModel Object_topSubscriptions;

  CustomTopSubscriptions({
    required this.Object_topSubscriptions,
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
          image: AssetImage('${Object_topSubscriptions.imageUrl}'),
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
                  '${Object_topSubscriptions.fieldLogo}',
                ),
                radius: 25,
              ),
              10.horizontalSpace,
              Text(
                "${Object_topSubscriptions.title}",
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
