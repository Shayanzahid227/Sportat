import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/subscription_membership_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMembershipCard extends StatelessWidget {
  final MembershipCardModel membership;
  const CustomMembershipCard({
    super.key,
    required this.membership,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: membership.color ?? primaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            membership.title,
            style: style16B.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(
            color: whiteColor,
            thickness: 1,
          ),

          // Price and Points
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: whiteColor, width: 2),
                ),
                child: Icon(Icons.attach_money, color: whiteColor, size: 20),
              ),
              3.horizontalSpace,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.12,
                child: Text(
                  '${membership.price.toInt()} SAR',
                  style: style14B.copyWith(
                    color: whiteColor,
                  ),
                ),
              ),
              Spacer(),
              Image.asset(
                AppAssets().pointsEarnIcon,
                color: whiteColor,
                scale: 5,
              ),
              3.horizontalSpace,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.10,
                child: Text(
                  membership.points.toString(),
                  style: style14B.copyWith(
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: whiteColor,
            thickness: 1,
          ),

          // Description
          Expanded(
            child: Text(
              membership.description,
              style: style14.copyWith(color: whiteColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
