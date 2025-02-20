import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/sportat/interest_screen.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/auth/success_screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InterestScreenViewModel(),
      child: Consumer<InterestScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: whitecolor,
          body: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                const SizedBox(height: 60),
                _header(model),
                20.verticalSpace,
                _selectedinterest(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(InterestScreenViewModel model) {
    // final model = Provider.of<InterestScreenViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xfff5B7083),
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: Color(0xfff5B7083),
          ),
        ),
        Text(
          "Interest",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: blackColor),
        ),
        TextButton(
            onPressed: () => model.onSkip(context),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xfff9EB94533 % 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessScreen()));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: model.isSelected ? Colors.white : blackColor,
                  fontSize: 16.sp,
                ),
              ),
            )),
      ],
    );
  }

  _selectedinterest(InterestScreenViewModel model) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.8,
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 5),
        itemCount: model.interestList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              model.getColorChnage(index);
            },
            child: CustomInterestScreen(
              ObjectInterestScreenModel: model.interestList[index],
              isColorChange: model.isColorChange,
              index: index,
            ),
          );
        },
      ),
    ));
  }
}
