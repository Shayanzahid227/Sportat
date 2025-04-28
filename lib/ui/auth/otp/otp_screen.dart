// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/auth/otp/otp_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  String? countrycode;
  String? phoneNumber;
  OTPScreen({required this.countrycode, required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpViewModel(),
      child: Consumer<OtpViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,

          ///
          /// Start App Bar
          ///
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0),
              child: CustomAppBar(
                title: "OTP Verification",
              )),
          body: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.4,
            color: backGroundColor,
            child: Column(
              children: [
                30.verticalSpace,
                Image.asset(
                  AppAssets().otp,
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          ///
          /// Bottom Sheet
          ///
          bottomSheet: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 7 / 10,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: primaryColor, width: 0.7),
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        30.verticalSpace,
                        Text(
                          "An 6 digit code has been sent to \n"
                          "$countrycode $phoneNumber",
                          textAlign: TextAlign.center,
                          style: style16.copyWith(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Pinput(
                            length: 6,
                            // Active Border (Focused)
                            focusedPinTheme: PinTheme(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color:
                                        secondaryColor), // Active border color (Blue)
                              ),
                            ),
                            defaultPinTheme: PinTheme(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: borderColor),
                              ),
                            ),
                            preFilledWidget: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 24, color: lightGreyColor),
                            ),
                            obscureText: false,
                            controller: model.otpController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              model.updateOtp(value);
                            },
                          ),
                        ),
                        50.verticalSpace,
                        GestureDetector(
                          onTap: model.canResend
                              ? () {
                                  model.resendCode();
                                }
                              : null, // Disable if countdown is active
                          child: Container(
                            width: 180,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    model.canResend ? Colors.blue : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                model.canResend
                                    ? "Resend Code"
                                    : "Resend Code in 00:${model.secondsRemaining.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  color: model.canResend
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Your OTP code content will go here
          ),
        ),
      ),
    );
  }
}
