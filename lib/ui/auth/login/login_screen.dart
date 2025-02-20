import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/custom_widgets/buttons/socail_button.dart';
import 'package:code_structure/custom_widgets/dialog_box/line_with_text.dart';
import 'package:code_structure/ui/auth/login/login_view_model.dart';
import 'package:code_structure/ui/auth/otp/otp_screen.dart';
import 'package:code_structure/ui/home/home_Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets().splashScreen),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                60.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets().loginScreenLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                60.verticalSpace,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Expanded(
                      child: Column(
                        children: [
                          20.verticalSpace,
                          Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Log In To Access Exclusive\nFeatures And Content',
                              textAlign: TextAlign.center,
                              style: style25N.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Color(0xfff4a4a4a),
                              ),
                            ),
                          )),
                          30.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      10.horizontalSpace,
                                      Image.asset(
                                        AppAssets().arabFlag,
                                        width: 24,
                                        height: 24,
                                      ),
                                      10.horizontalSpace,
                                      Text('+966'),
                                      Icon(Icons.arrow_drop_down),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                                hintText: 'Phone Number',
                                hintStyle: style14N.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff595959),
                                ),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          _continueButton(),
                          20.verticalSpace,
                          // Add other login form widg
                          _LoginAsGuest(),
                          60.verticalSpace,
                          Center(
                            child: CustomLineWithText(
                              text: 'or continue with',
                            ),
                          ),
                          _socialButtons(),
                          10.verticalSpace,
                          Center(
                            child: _warning(),
                          ),
                          //ets here
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _continueButton() {
    return CustomloginButton(
      text: 'Continue',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => otpSCreen()),
        );
      },
    );
  }

  _LoginAsGuest() {
    return CustomloginButton(
      text: 'Login As Guest',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
  }

  _socialButtons() {
    return Center(
      child: Container(
        width: 200.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomsocialIconButton(
              onPressed: () {},
              imagePath: AppAssets().googleIcon,
            ),
            20.horizontalSpace,
            CustomsocialIconButton(
              onPressed: () {},
              imagePath: AppAssets().facebookIcon,
            ),
            20.horizontalSpace,
            CustomsocialIconButton(
              onPressed: () {},
              imagePath: AppAssets().appleIcon,
            ),
          ],
        ),
      ),
    );
  }

  _warning() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By logging in, you accept our Terms of',
          textAlign: TextAlign.center,
          style: style14.copyWith(fontSize: 12, color: blackColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'Terms & Conditions',
                style: style14.copyWith(
                  fontSize: 12,
                  color: PrimaryColor,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              "And",
              style: style14.copyWith(fontSize: 12, color: blackColor),
            ),
            SizedBox(width: 4),
            GestureDetector(
              onTap: () {},
              child: Text(
                "privacy policy",
                style: style14.copyWith(fontSize: 12, color: PrimaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
