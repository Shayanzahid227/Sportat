import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/text_field.dart';
import 'package:code_structure/ui/home/home_Screen/home_screen_view_model.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundCOlor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                57.verticalSpace,
                _header(),
                20.verticalSpace,
                _searchField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// header
  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff000000 % 40),
          radius: 30,
          backgroundImage: AssetImage(AppAssets().profileImage),
        ),
        10.horizontalSpace,
        Row(
          children: [
            Container(
              height: 25.h,
              width: 19.w,
              decoration: BoxDecoration(
                color: whitecolor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppAssets().locationIcon,
                fit: BoxFit.cover,
                color: borderColor,
              ),
            ),
            5.horizontalSpace,
            Text(
              'Riyadh Area',
              style: style14B.copyWith(
                  fontWeight: FontWeight.w400, color: blackColor),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.arrow_drop_down,
                color: blackColor,
                size: 50,
              ),
            )
          ],
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 51,
                height: 51,
                decoration: BoxDecoration(
                  color: SecondryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(2, 5),
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AppAssets().pointsEarnIcon,
                    ),
                    fit: BoxFit.cover,
                    height: 34.h,
                    color: whitecolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "1K",
                  style: style25B.copyWith(
                    color: SecondryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

//  search field
  _searchField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue.shade100, // Light blue border
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Search Icon
          // Padding(
          //   padding: const EdgeInsets.only(left: 12),
          //   child: Icon(
          //     Icons.search, // Replace with your custom icon
          //     color: Colors.grey[600],
          //     size: 24,
          //   ),
          // ),

          // Search TextField
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: customtextformfeild(
                prefixIcon: Image.asset(
                  AppAssets().searchfieldIcon,
                  color: blackColor,
                ),
                text: 'search for sports or fields',
                obscureText: false,
              ), // Replace with your custom TextField
            ),
          ),

          // Filter Icon
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.tune, // Replace with your custom filter icon
              color: Colors.green,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
