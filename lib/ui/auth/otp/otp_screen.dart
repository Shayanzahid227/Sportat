import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/ui/auth/otp/otp_sc%20reen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class otpSCreen extends StatefulWidget {
  const otpSCreen({super.key});

  @override
  State<otpSCreen> createState() => _otpSCreenState();
}

class _otpSCreenState extends State<otpSCreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpViewModel(),
      child: Consumer<OtpViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      20.verticalSpace,
                      Row(
                        children: [
                          20.horizontalSpace,
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "OTP Verification",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Add a SizedBox with same width as back button for perfect centering
                          SizedBox(width: 60),
                        ],
                      ),
                      20.verticalSpace, // Added space before image
                      Image.asset(
                        AppAssets().otp,
                        height: 150, // Reduced from 200 to 150
                        width: 150, // Added width constraint
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: PrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              30.verticalSpace,
                              Text(
                                "An 6 digit code has been sent to \n +966 9995380399",
                                textAlign: TextAlign.center,
                                style: style16.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              20.verticalSpace,
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: PinCodeTextField(
                                  appContext: context,
                                  length: 6,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(12),
                                    fieldHeight: 50,
                                    fieldWidth: 45,
                                    activeFillColor: Colors.white,
                                    inactiveFillColor: Colors.white,
                                    selectedFillColor: Colors.white,
                                    activeColor: Colors.grey[300],
                                    inactiveColor: Colors.grey[300],
                                    selectedColor: SecondryColor,
                                  ),
                                  enableActiveFill: true,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              20.verticalSpace,
                              Text(
                                "Didn't Receive The Code?",
                                style: style16.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              20.verticalSpace,
                              Container(
                                  width: 180,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: borderColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("Resend Code in 00:20 "),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    // Your OTP code content will go here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
