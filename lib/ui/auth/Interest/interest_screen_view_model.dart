import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/Interest_screen_model.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class InterestScreenViewModel extends BaseViewModel {
  Set<int> selectedInterests = {};

  void toggleSelection(int index) {
    if (selectedInterests.contains(index)) {
      selectedInterests.remove(index);
    } else {
      selectedInterests.add(index);
    }
    notifyListeners();
  }

  bool isSelected(int index) {
    return selectedInterests.contains(index);
  }

  // Initialize interest list
  List<InterestModel> interestList = [
    InterestModel(icon: AppAssets().cameraIcon, title: 'video'),
    InterestModel(icon: AppAssets().bookIcon, title: 'Books'),
    InterestModel(icon: AppAssets().footballIcon, title: 'Football'),
    InterestModel(icon: AppAssets().bookIcon, title: 'Books'),
    InterestModel(icon: AppAssets().footballIcon, title: 'Football'),
    InterestModel(icon: AppAssets().cameraIcon, title: 'video'),
    InterestModel(icon: AppAssets().cameraIcon, title: 'video'),
    InterestModel(icon: AppAssets().bookIcon, title: 'Books'),
    InterestModel(icon: AppAssets().footballIcon, title: 'Football'),
    InterestModel(icon: AppAssets().bookIcon, title: 'Books'),
    InterestModel(icon: AppAssets().footballIcon, title: 'Football'),
    InterestModel(icon: AppAssets().cameraIcon, title: 'video'),
  ];

  ///
  /// function for toggling selection of interest items
  ///

  ///
  /// function for color changing of interested fields like video etc
  ///
  int isColorChange = 0;
  void getColorChnage(int index) {
    isColorChange = index;
    notifyListeners();
  }

  // on skip button function
  void onSkip(BuildContext context) {
    _navigateToSignUpScreen(context);
  }

  void _navigateToSignUpScreen(BuildContext context) {
    // Navigate to your home screen or main app
    Navigator.pushReplacement(
      context,

      ///
      ///change the navigation path Later on
      ///
      MaterialPageRoute(builder: (_) => SignUpScreen()),
    );
  }

  // Check if a specific interest is selected
  bool isInterestSelected(int index) {
    return selectedInterests.contains(index);
  }
}
