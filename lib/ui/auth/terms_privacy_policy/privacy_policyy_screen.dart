import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BaseViewModel(),
      child: Consumer<BaseViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundCOlor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigator?.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xfff5B7083),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20,
                          color: Color(0xfff5B7083),
                        ),
                      ),
                    ),
                    30.horizontalSpace,
                    const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                _articalOne(),
                20.verticalSpace,
                _articalTw0(),
              ],
            ),
          ),
        ),
      ),
    );
    //
  }

  _articalOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Article 1',
          style: style25.copyWith(
            fontWeight: FontWeight.w500,
            color: articalColor,
          ),
        ),
        20.verticalSpace,
        Text(
          "Who May Use the",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
        5.verticalSpace,
        Text(
          "Services",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
        5.verticalSpace,
        Text(
          "When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. ",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "• Step 1: You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction. ",
            style: style14.copyWith(
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "• Step 2: Our Privacy Policy describes how we handle the information you provide to us when you use our Services.",
            style: style14.copyWith(
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
        ),
      ],
    );
  }

  _articalTw0() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Article 2',
          style: style25.copyWith(
            fontWeight: FontWeight.w500,
            color: articalColor,
          ),
        ),
        20.verticalSpace,
        Text(
          "Who May Use the",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
        5.verticalSpace,
        Text(
          "Services",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
        5.verticalSpace,
        Text(
          "When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. ",
          style: style16.copyWith(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  // artica 02
}
