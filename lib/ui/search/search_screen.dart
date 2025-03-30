// ignore_for_file: must_be_immutable

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  int search;
  SearchScreen({required this.search});
  final List<String> recentSearches = [
    'Race club',
    'Football club',
    'The champion club',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF0F4F8FF),

      ///
      /// Start Body
      ///
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _searchField(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Search', style: style16),
                TextButton(
                  onPressed: () {},
                  child: Text('Clear All', style: style16B),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets()
                                .searchicon2, // Assuming this is the slider/filter icon
                            scale: 5,
                          ),
                          20.horizontalSpace,
                          Text(
                            recentSearches[index],
                            style: style16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_searchField(BuildContext context) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBackButton(),
          SizedBox(width: 8),
          Expanded(
              child: TextFormField(
            decoration: authSignUpFieldDecoration.copyWith(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Search for sports or fields',
              hintStyle: style16.copyWith(color: lightGreyColor),
              prefixIcon: Image.asset(
                AppAssets().searchicon2,
                scale: 4,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  SearchFilterBottomSheet.show(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    AppAssets()
                        .searchfieldIcon, // Assuming this is the slider/filter icon
                    scale: 5,
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    ),
  );
}
