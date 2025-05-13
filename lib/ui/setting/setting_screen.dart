import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchNotification = true;

  ///
  ///      push notification
  ///
  void _pushNotification(bool newValue) {
    setState(() {
      _switchNotification = newValue;
      print('Notification');
    });
  }

  ///
  ///      dark mode
  ///
  bool _switchDarkMode = false;
  void _darkMode(bool newValue) {
    setState(() {
      _switchDarkMode = newValue;
      print('Dark');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          isBackButton: true,
          title: "Setting Screen",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            30.verticalSpace,

            ///
            ///       push notification section
            ///
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notification',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Push Notification',
                          style: style16.copyWith(color: lightGreyColor),
                        ),
                        CupertinoSwitch(
                            value: _switchNotification,
                            onChanged: _pushNotification)
                      ],
                    ),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
            20.verticalSpace,

            ///
            ///      dark mode section
            ///
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enable Dark Mode',
                          style: style16.copyWith(color: darkGreyColor),
                        ),
                        CupertinoSwitch(
                            value: _switchDarkMode, onChanged: _darkMode)
                      ],
                    ),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets().translationIcon,
                          scale: 4,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Language',
                          style: style16.copyWith(color: lightGreyColor),
                        ),
                        Spacer(),
                        Text(
                          'English',
                          style: style16.copyWith(color: darkGreyColor),
                        ),
                        5.horizontalSpace,
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: lightGreyColor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        _showLogOutDialog(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets().logoutIcon,
                            scale: 4,
                          ),
                          10.horizontalSpace,
                          Text(
                            'LogOut',
                            style: style16.copyWith(color: lightGreyColor),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: lightGreyColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  ///      dialogue box
  ///

  void _showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85.h,
                width: 85.w,
                decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.red)),
                child: Image.asset(
                  AppAssets().logoutIcon,
                  scale: 3,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Log Out',
                style: style25B.copyWith(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Are You Sure You Want To Log Out?',
                style: TextStyle(fontSize: 16, color: darkGreyColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomButton(
                  border: Colors.red,
                  boxColor: Colors.red,
                  text: 'Yes',
                  onPressed: () {
                    navigator?.pop(context);
                  }),
              10.verticalSpace,
              CustomButton(
                  textColor: primaryColor,
                  boxColor: whiteColor,
                  text: 'Cancel',
                  onPressed: () {
                    navigator?.pop(context);
                  })
            ],
          ),
        );
      },
    );
  }
}
