import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/custom_widgets/sportat/text_field.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_screen.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: backGroundCOlor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      64.verticalSpace,
                      _header(),
                      30.verticalSpace,
                      _authFields(),
                      15.verticalSpace,
                      _gender(),
                      45.verticalSpace,
                      _custombutton(),
                      60.verticalSpace,
                      _warning(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// header
  _header() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 25,
            color: borderColor,
          ),
        ),
        40.horizontalSpace,
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Create an account",
            style: style25B.copyWith(
                fontWeight: FontWeight.w500, color: Color(0xfff4A4A4A)),
          ),
        )
      ],
    );
  }

// textfield
  _authFields() {
    final model = Provider.of<SignUpViewModel>(context);
    return Column(
      children: [
        customtextformfeild(
          text: 'Name',
          obscureText: false,
        ),
        10.verticalSpace,
        customtextformfeild(
          text: 'User name',
          obscureText: false,
        ),
        10.verticalSpace,
        customtextformfeild(
          text: 'email',
          obscureText: false,
        ),
        10.verticalSpace,
        customtextformfeild(
          text: model.selectedCountry ?? 'Select Country',
          obscureText: false,
          suffixIcon: GestureDetector(
            onTap: () => _selectedCountry(),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: blackColor,
            ),
          ),
        ),
        10.verticalSpace,
        customtextformfeild(
          text: model.selectedCity ?? 'Select City',
          obscureText: false,
          suffixIcon: GestureDetector(
            onTap: () => _selectedCity(),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: blackColor,
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }

//select gender
  _gender() {
    final model = Provider.of<SignUpViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: style14N.copyWith(
            fontWeight: FontWeight.w500,
            color: Color(0xff4A4A4A),
          ),
        ),
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120.w,
              child: GestureDetector(
                onTap: () => model.setSelectedGender('male'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: model.selectedGender == 'male'
                        ? Color(0xff7E6EF2)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xff7E6EF2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      15.horizontalSpace,
                      Text(
                        'Males',
                        style: style14N.copyWith(
                          color: model.selectedGender == 'male'
                              ? Colors.white
                              : Color(0xff7E6EF2),
                        ),
                      ),
                      Image.asset(
                        AppAssets().gendermaleIcon,
                        height: 20,
                        width: 20,
                        color: model.selectedGender == 'male'
                            ? Colors.white
                            : Color(0xff7E6EF2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            15.horizontalSpace,
            Container(
              width: 120.w,
              child: GestureDetector(
                onTap: () => model.setSelectedGender('female'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: model.selectedGender == 'female'
                        ? Color(0xff7E6EF2)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xff7E6EF2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      15.horizontalSpace,
                      Text(
                        'Females',
                        style: style14N.copyWith(
                          color: model.selectedGender == 'female'
                              ? Colors.white
                              : Color(0xff7E6EF2),
                        ),
                      ),
                      Image.asset(
                        AppAssets().genderfemaleIcon,
                        height: 20,
                        width: 20,
                        color: model.selectedGender == 'female'
                            ? Colors.white
                            : Color(0xff7E6EF2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

//button
  _custombutton() {
    return CustomloginButton(
      text: 'sign Up',
      onPressed: () {},
    );
  }

//warning
  _warning() {
    return Column(
      children: [
        Text(
          "By signing up, you agree to our Terms of ",
          style: style14.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xfff212529),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                "The terms ",
                style: style14.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: PrimaryColor,
                ),
              ),
            ),
            Text(
              "And ",
              style: style14.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xfff212529),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Privacy Policy",
                style: style14.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: PrimaryColor,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

// select country bottom sheet
  _selectedCountry() {
    final model = Provider.of<SignUpViewModel>(context, listen: false);
    return showModalBottomSheet(
      backgroundColor: whitecolor,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Select Country",
                    style: style25.copyWith(
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  // Positioned(
                  //   right: 0,

                  //   child: GestureDetector(
                  //     onTap: () => Navigator.pop(context),
                  //     child: Container(
                  //       height: 30.h,
                  //       width: 30.w,
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: Colors.grey),
                  //       ),
                  //       child: Icon(Icons.close),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // Search Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: customtextformfeild(
                text: 'Search',
                obscureText: false,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),

            // Country List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemCount: model.countries.length,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Divider(
                    height: 1,
                    color: borderColor,
                  ),
                ),
                itemBuilder: (context, index) {
                  final country = model.countries[index];
                  final isSelected = model.selectedCountry == country;

                  return ListTile(
                    title: Text(
                      country,
                      style: style14N.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: PrimaryColor)
                        : null,
                    onTap: () {
                      model.setSelectedCountry(country);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),

            // Done Button
            Padding(
              padding: EdgeInsets.all(16),
              child: CustomloginButton(
                text: 'Done',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

// selected city
  _selectedCity() {
    final model = Provider.of<SignUpViewModel>(context, listen: false);
    return showModalBottomSheet(
      backgroundColor: whitecolor,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Select City",
                    style: style25.copyWith(
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  // Positioned(
                  //   right: 0,

                  //   child: GestureDetector(
                  //     onTap: () => Navigator.pop(context),
                  //     child: Container(
                  //       height: 30.h,
                  //       width: 30.w,
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: Colors.grey),
                  //       ),
                  //       child: Icon(Icons.close),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // Search Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: customtextformfeild(
                text: 'Search',
                obscureText: false,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),

            // Country List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemCount: model.cities.length,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Divider(
                    height: 1,
                    color: borderColor,
                  ),
                ),
                itemBuilder: (context, index) {
                  final city = model.cities[index];
                  final isSelected = model.selectedCity == city;

                  return ListTile(
                    title: Text(
                      city,
                      style: style14N.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: PrimaryColor)
                        : null,
                    onTap: () {
                      model.setSelectedCity(city);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),

            // Done Button
            Padding(
              padding: EdgeInsets.all(16),
              child: CustomloginButton(
                text: 'Done',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
