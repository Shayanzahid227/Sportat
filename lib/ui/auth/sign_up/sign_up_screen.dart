// ignore_for_file: use_key_in_widget_constructors, unused_element

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/auth/login/login_screen.dart';
import 'package:code_structure/ui/terms_privacy_policy/termns_and%20_condition_screen.dart';
import 'package:code_structure/ui/terms_privacy_policy/privacy_policyy_screen.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/auth/Interest/interest_Screen.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,

          ///
          /// Start App Bar
          ///
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0),
              child: CustomAppBar(
                title: "Create an account",
              )),

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  _authFields(context),
                  // CSCPickerPlus(
                  //     layout: Layout.vertical,
                  //     flagState: CountryFlag.ENABLE,
                  //     onCountryChanged: (country) {
                  //       print(country);
                  //     },
                  //     onStateChanged: (state) {
                  //       print(state);
                  //     },
                  //     onCityChanged: (city) {
                  //       print(city);
                  //     },

                  //     ///placeholders for dropdown search field
                  //     countrySearchPlaceholder: "Country",
                  //     stateSearchPlaceholder: "State",
                  //     citySearchPlaceholder: "City",

                  //     ///labels for dropdown
                  //     countryDropdownLabel: "Select Country",
                  //     stateDropdownLabel: "Select State",
                  //     cityDropdownLabel: "Select City",
                  //     dropdownDialogRadius: 30.0,
                  //     searchBarRadius: 10.0,

                  //     dropdownDecoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //         color: whitecolor,
                  //         border: Border.all(color: bordrColor, width: 1)),
                  //     disabledDropdownDecoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //         color: whitecolor,
                  //         border: Border.all(color: borderColor, width: 1)),

                  //     ///selected item style [OPTIONAL PARAMETER]
                  //     selectedItemStyle: style16.copyWith(
                  //       color: blackColor,
                  //     ),

                  //     ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  //     dropdownHeadingStyle: style16B,

                  //     ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  //     dropdownItemStyle: style16.copyWith(color: blackColor)),
                  15.verticalSpace,
                  _gender(context),
                  45.verticalSpace,
                  _custombutton(context),
                  60.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "I have an account?",
                        style: style16,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(LoginScreen());
                        },
                        child: Text(
                          "Sign In",
                          style: style16B.copyWith(color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  _warning(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// textfield
  _authFields(BuildContext context) {
    final model = Provider.of<SignUpViewModel>(context);
    return Column(
      children: [
        TextFormField(
          decoration: authSignUpFieldDecoration.copyWith(
            hintText: "Name",
          ),
          validator: (val) {
            return null;
          },
          onChanged: (value) {},
        ),
        10.verticalSpace,
        TextFormField(
          decoration: authSignUpFieldDecoration.copyWith(hintText: "User name"),
          validator: (val) {
            return null;
          },
          onChanged: (value) {},
        ),
        10.verticalSpace,
        TextFormField(
          decoration: authSignUpFieldDecoration.copyWith(hintText: "Email"),
          validator: (val) {
            return null;
          },
          onChanged: (value) {},
        ),
        10.verticalSpace,
        10.verticalSpace,
        TextFormField(
          readOnly: true,
          onTap: () {
            showCustomCountryPicker(context, (selectedCountry) {
              model.selectCountry(selectedCountry);
            });
          },
          decoration: authSignUpFieldDecoration.copyWith(
            hintText: model.selectedCountry?.name ?? 'Select Country',
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: blackColor,
            ),
          ),
        ),
        10.verticalSpace,
        TextFormField(
          readOnly: true,
          onTap: () {
            showCustomCityPicker(context, model.selectedCities, (selectedCity) {
              model.selectCity(selectedCity);
            }, model);
          },
          decoration: authSignUpFieldDecoration.copyWith(
            hintText: model.selectedCity ?? 'Select City',
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: blackColor,
            ),
          ),
        ),
      ],
    );
  }

//select gender
  _gender(BuildContext context) {
    final model = Provider.of<SignUpViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: style14N.copyWith(
            fontWeight: FontWeight.w500,
            color: titleColor,
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
                        ? secondaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: secondaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Males',
                        style: style14N.copyWith(
                          color: model.selectedGender == 'male'
                              ? Colors.white
                              : secondaryColor,
                        ),
                      ),
                      Image.asset(
                        AppAssets().gendermaleIcon,
                        height: 20,
                        width: 20,
                        color: model.selectedGender == 'male'
                            ? Colors.white
                            : secondaryColor,
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
                        ? secondaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: secondaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Females',
                        style: style14N.copyWith(
                            color: model.selectedGender == 'female'
                                ? Colors.white
                                : secondaryColor),
                      ),
                      Image.asset(AppAssets().genderfemaleIcon,
                          height: 20,
                          width: 20,
                          color: model.selectedGender == 'female'
                              ? Colors.white
                              : secondaryColor)
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
  _custombutton(BuildContext context) {
    return CustomButton(
      text: 'Sign Up',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterestScreen()),
        );
      },
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
            color: lightRedColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  TermsScreen(),
                );
              },
              child: Text(
                "The terms ",
                style: style14.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: primaryColor,
                ),
              ),
            ),
            Text(
              "And ",
              style: style14.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: lightRedColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  PrivacyPolicyScreen(),
                );
              },
              child: Text(
                "Privacy Policy",
                style: style14.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: primaryColor,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

_outlineBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  );
}

void showCustomCountryPicker(BuildContext context, Function(Country) onSelect) {
  List<Country> countryList = CountryService().getAll(); // ✅ Get all countries
  List<Country> filteredCountries = List.from(countryList); // ✅ Filtered List

  Country? selectedCountry; // ✅ Track selected country

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    scrollControlDisabledMaxHeightRatio: 2,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                    title: Center(
                      child: Text(
                        "Select Country",
                        style: style25.copyWith(color: blackColor),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppAssets().close,
                        scale: 3.5,
                      ),
                    )),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Country',
                      prefixIcon: Image.asset(
                        AppAssets().countrySearchIcon,
                        scale: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        filteredCountries = countryList
                            .where((country) => country.name
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredCountries.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      Country country = filteredCountries[index];
                      return ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        title: Text(
                          country.name,
                          style: style16,
                        ),
                        trailing: selectedCountry == country
                            ? Icon(Icons.check_circle,
                                size: 25.sp,
                                color: Colors.green) // ✅ Show check icon
                            : null,
                        onTap: () {
                          setState(() {
                            selectedCountry =
                                country; // ✅ Update selected country
                          });
                          onSelect(country);
                        },
                      );
                    },
                  ),
                ),
                CustomButton(
                    text: "Done",
                    onPressed: () {
                      Navigator.pop(context, selectedCountry);
                    }),
              ],
            ),
          );
        },
      );
    },
  );
}

void showCustomCityPicker(BuildContext context, List<String> cities,
    Function(String) onSelect, SignUpViewModel model) {
  List<String> filteredCities = List.from(model.selectedCities);
  String? selectedCity; // ✅ Track selected city

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    scrollControlDisabledMaxHeightRatio: 2,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Center(
                    child: Text(
                      "Select City",
                      style: style25.copyWith(color: blackColor),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(AppAssets().close, scale: 3.5),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search City',
                      prefixIcon: Image.asset(
                        AppAssets().countrySearchIcon,
                        scale: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        filteredCities = model.selectedCities
                            .where((city) => city
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: filteredCities.isEmpty
                      ? Center(
                          child: Text(
                          "No cities found",
                          style: style20.copyWith(color: blackColor),
                        ))
                      : ListView.separated(
                          itemCount: filteredCities.length,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                            height: 1,
                          ),
                          itemBuilder: (context, index) {
                            String city = filteredCities[index];
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              title: Text(city, style: style16),
                              trailing: selectedCity == city
                                  ? Icon(Icons.check_circle,
                                      size: 25,
                                      color: Colors.green) // ✅ Show check icon
                                  : null,
                              onTap: () {
                                setState(() {
                                  selectedCity = city;
                                });
                                onSelect(city);
                              },
                            );
                          },
                        ),
                ),
                filteredCities.isEmpty
                    ? SizedBox()
                    : CustomButton(
                        text: "Done",
                        onPressed: () {
                          Navigator.pop(context, selectedCity);
                        }),
              ],
            ),
          );
        },
      );
    },
  );
}
