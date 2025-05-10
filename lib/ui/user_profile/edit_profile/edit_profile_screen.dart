// ignore_for_file: use_key_in_widget_constructors, unused_element

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/auth/Interest/interest_Screen.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/user_profile/edit_profile/edit_profile_view_model.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(),
      child: Consumer<EditProfileViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,

          ///
          /// Start App Bar
          ///
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0),
              child: CustomAppBar(
                title: "Edit Profile",
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
                  15.verticalSpace,
                  45.verticalSpace,
                  _custombutton(context),
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
    final model = Provider.of<EditProfileViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          decoration:
              authSignUpFieldDecoration.copyWith(hintText: "Email Address"),
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
        10.verticalSpace,
        Text(
          'About me',
          style: style14.copyWith(color: blackColor),
        ),
        10.verticalSpace,
        TextFormField(
          decoration: authSignUpFieldDecoration.copyWith(
            hintText: 'about ',
          ),
        ),
        10.verticalSpace,
        TextFormField(
          readOnly: true,
          decoration: authSignUpFieldDecoration.copyWith(
              hintText: 'select interest ',
              suffixIcon: GestureDetector(
                onTap: () {
                  Get.to(InterestScreen());
                },
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: blackColor,
                ),
              )),
        ),
      ],
    );
  }

//button
  _custombutton(BuildContext context) {
    return CustomButton(
      text: 'Save',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterestScreen()),
        );
      },
    );
  }

  _outlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(15),
    );
  }

  void showCustomCountryPicker(
      BuildContext context, Function(Country) onSelect) {
    List<Country> countryList =
        CountryService().getAll(); // ✅ Get all countries
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
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
      Function(String) onSelect, EditProfileViewModel model) {
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
                                        color:
                                            Colors.green) // ✅ Show check icon
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
}
