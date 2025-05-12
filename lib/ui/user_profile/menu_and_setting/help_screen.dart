import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/terms_privacy_policy/privacy_policyy_screen.dart';
import 'package:code_structure/ui/terms_privacy_policy/termns_and%20_condition_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/customer_support/customer_suppoet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(isBackButton: true, title: 'Help'
            //  title: "My Orders",
            ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            20.verticalSpace,
            customItem('Customer Support', () {
              Get.to(CustomerSupportScreen());
            }),
            20.verticalSpace,
            customItem('Privacy Policy', () {
              Get.to(PrivacyPolicyScreen());
            }),
            20.verticalSpace,
            customItem('Terms & Conditions', () {
              Get.to(TermsScreen());
            })
          ],
        ),
      ),
    );
  }

  GestureDetector customItem(title, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: style14.copyWith(color: lightGreyColor),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: lightGreyColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
