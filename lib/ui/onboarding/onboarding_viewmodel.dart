import 'package:code_structure/ui/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_assest.dart';
import 'onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  late final PageController pageController;

  OnboardingViewModel() {
    pageController = PageController();
  }

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Sports Booking',
      description:
          'Easily book a range of sports facilities and activities at any time that suits you.',
      backgroundImage: AppAssets().onboarding1,
    ),
    OnboardingModel(
      title: 'Earn Points',
      description:
          'Accumulate points with each booking and redeem them for additional services and perks within the app.',
      backgroundImage: AppAssets().onboarding2,
    ),
    OnboardingModel(
      title: 'Sports Content',
      description:
          'Enjoy a variety of posts, short videos, and stay connected with an active community of sports enthusiasts.',
      backgroundImage: AppAssets().onboarding3,
    ),
  ];

  int get currentIndex => _currentIndex;
  OnboardingModel get currentPage => pages[_currentIndex];
  bool get isLastPage => _currentIndex == pages.length - 1;

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void moveToNextPage(BuildContext context) {
    if (isLastPage) {
      _navigateToSignUp(context);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onSkip(BuildContext context) {
    _navigateToSignUp(context);
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
