// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/custom_widgets/sportat/interest_screen.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/auth/success_screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InterestScreenViewModel(),
      child: Consumer<InterestScreenViewModel>(
          builder: (context, model, child) => Scaffold(
              backgroundColor: whiteColor,

              ///
              /// App Bar
              ///
              appBar: _appBar(model, context),

              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.3,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: model.interestList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => model.toggleSelection(index),
                      child: CustomInterestWidget(
                        interestModel: model.interestList[index],
                        isSelected: model.isSelected(index),
                        index: index,
                      ),
                    );
                  },
                ),
              ))),
    );
  }
}

AppBar _appBar(
  InterestScreenViewModel model,
  BuildContext context,
) {
  return AppBar(
    backgroundColor: whiteColor,
    shadowColor: whiteColor,
    surfaceTintColor: whiteColor,
    foregroundColor: whiteColor,
    leading: Padding(
      padding: const EdgeInsets.all(13.0),
      child: CustomBackButton(),
    ),
    centerTitle: true,
    title: Text(
      "Interest",
      style: style25,
    ),
    actions: [
      TextButton(
        onPressed: () => model.onSkip(context),
        style: TextButton.styleFrom(
          backgroundColor: custardColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SuccessScreen(),
              ),
            );
          },
          child: Text(
            'Skip',
            style: TextStyle(
              color: blackColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      )
    ],
  );
}
