// ignore_for_file: deprecated_member_use

import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardingViewModel(),
        child: Consumer<OnboardingViewModel>(
            builder: (context, model, child) => Scaffold(
                    body: Stack(
                  children: [
                    PageView.builder(
                      controller: model.pageController,
                      onPageChanged: model.onPageChanged,
                      itemCount: model.pages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.asset(
                              model.pages[index].backgroundImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.0, 0.3, 0.6, 1.0],
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.3),
                                    Colors.black.withOpacity(0.7),
                                    Colors.black.withOpacity(0.9),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // Content
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            // Skip button
                            if (!model.isLastPage)
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () => model.onSkip(context),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            const Spacer(),

                            // Title and Description
                            Column(
                              children: [
                                Text(
                                  model.currentPage.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  model.currentPage.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 40.h),

                            // Page Indicators
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                model.pages.length,
                                (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  width: model.currentIndex == index
                                      ? 100.w
                                      : 100.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: model.currentIndex == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 24.h),
                            // Next/Get Started Button

                            CustomButton(
                              text: model.isLastPage ? 'Get Started' : 'Next',
                              onPressed: () => model.moveToNextPage(context),
                            ),
                            16.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
