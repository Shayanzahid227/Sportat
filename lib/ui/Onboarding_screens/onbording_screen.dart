import 'package:code_structure/ui/screens/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Scaffold(
        body: Consumer<OnboardingViewModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                // Background Image
                Image.asset(
                  model.currentPage.backgroundImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                // Content
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Skip button
                        if (!model.isLastPage)
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () => model.onSkip(context),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),

                        const Spacer(),

                        // Title
                        Text(
                          model.currentPage.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Description
                        Text(
                          model.currentPage.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Page Indicator and Next Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Page Indicator
                            Row(
                              children: List.generate(
                                model.pages.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: model.currentIndex == index
                                        ? Colors.purple
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),

                            // Next/Get Started Button
                            ElevatedButton(
                              onPressed: () => model.moveToNextPage(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 100.w,
                                  vertical: 16.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                model.isLastPage ? 'Get Started' : 'Next',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
