// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/custom_widgets/buttons/socail_button.dart';
import 'package:code_structure/custom_widgets/dialog_box/line_with_text.dart';
import 'package:code_structure/ui/auth/login/login_view_model.dart';
import 'package:code_structure/ui/auth/otp/otp_screen.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_screen.dart';
import 'package:code_structure/ui/home/home_Screen/home_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(

            ///
            /// Start Body
            ///

            body: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 4 / 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets().bgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.asset(
                AppAssets().appLogo,
                scale: 3,
              ),
            ),

            ///
            /// Bottom Sheet
            ///
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
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
                          color: lightGreyColor,
                        ),
                      ),
                    )),
                    30.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: model.phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: Colors.white,
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.blueGrey),
                                  bottomSheetHeight: 500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) {
                                  model.updateCountry("+${country.phoneCode}",
                                      country.flagEmoji);
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    model.selectedFlag, // Emoji Flag Display
                                    style: TextStyle(
                                        fontSize: 20), // Bigger emoji flag
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    model.selectedCountryCode,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  10.horizontalSpace,
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff595959),
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    ///
                    /// Login as a user
                    ///
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        Get.to(OTPScreen(
                          countrycode: model.selectedCountryCode,
                          phoneNumber: model.phoneController.text,
                        ));
                      },
                    ),
                    20.verticalSpace,

                    ///
                    /// Login as a guest user
                    ///
                    CustomButton(
                      text: 'Login As Guest',
                      boxColor: transparentColor,
                      textColor: primaryColor,
                      onPressed: () {
                        Get.offAll(HomeScreen());
                      },
                    ),

                    20.verticalSpace,
                    Center(
                      child: CustomLineWithText(
                        text: 'or continue with',
                      ),
                    ),
                    _socialButtons(),

                    20.verticalSpace,

                    _haveAnAccount(),
                    Center(
                      child: _warning(),
                    ),
                    //ets here
                  ],
                ),
              ),
            )),
      ),
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
                  color: primaryColor,
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
                style: style14.copyWith(fontSize: 12, color: primaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}

_haveAnAccount() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "I have no account?",
        style: style16,
      ),
      TextButton(
        onPressed: () {
          Get.offAll(SignUpScreen());
        },
        child: Text(
          "Sign Up",
          style: style16B.copyWith(color: primaryColor),
        ),
      )
    ],
  );
}
