import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_screen.dart';
import 'package:code_structure/ui/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Sports Booking',
      description:
          'Easily book a range of sports facilities and activities at any time that suits you.',
      backgroundImage: AppAssets().onboarding1,
    ),
    OnboardingModel(
      title: 'Sports Booking',
      description:
          'Easily book a range of sports facilities and activities at any time that suits you.',
      backgroundImage: AppAssets().onboarding2,
    ),
    OnboardingModel(
      title: 'Sports Booking',
      description:
          'Easily book a range of sports facilities and activities at any time that suits you.',
      backgroundImage: AppAssets().onboarding3,
    ),
    // Add more pages as needed
  ];

  int get currentIndex => _currentIndex;
  OnboardingModel get currentPage => pages[_currentIndex];
  bool get isLastPage => _currentIndex == pages.length - 1;

  void onNext(BuildContext context) {
    if (isLastPage) {
      _navigateToSignUpScreen(context);
    } else {
      _currentIndex++;
      notifyListeners();
    }
  }

  void onSkip(BuildContext context) {
    _navigateToSignUpScreen(context);
  }

  void _navigateToSignUpScreen(BuildContext context) {
    // Navigate to your home screen or main app
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignUpScreen()),
    );
  }
}
