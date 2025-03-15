// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_top_subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopSubscriptions extends StatelessWidget {
  TopSubscriptionsModel topSubscriptions;

  CustomTopSubscriptions({
    required this.topSubscriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300.w,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${topSubscriptions.imageUrl}'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              '${topSubscriptions.fieldLogo}',
            ),
            radius: 25,
          ),
          10.horizontalSpace,
          Text(
            "${topSubscriptions.title}",
            style: style16B.copyWith(color: whitecolor),
          ),
        ],
      ),
    );
  }
}
