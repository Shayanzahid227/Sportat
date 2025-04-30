import 'package:code_structure/core/enums/view_state_model.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/booking/booking_screen.dart';
import 'package:code_structure/ui/home/home_screen.dart';
import 'package:code_structure/ui/store/store_screen.dart';
import 'package:code_structure/ui/subscription/subscribtion_screen.dart';
import 'package:code_structure/ui/timeline/timeline_screen.dart';
import 'package:flutter/material.dart';

class RootViewModel extends BaseViewModel {
  // final PageController pageController = PageController(initialPage: 0);

  int selectedScreen = 0;

  List<Widget> allScreen = [
    BookingScreen(),
    SubscriptionScreen(),
    HomeScreen(),
    StoreScreen(),
    TimelineScreen(),
  ];

  ///
  /// Constructor
  ///
  RootViewModel(val) {
    updatedScreen(val);
    notifyListeners();
  }

  // int selectIndex = 0;

  updatedScreen(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
    notifyListeners();
  }

  // pushScreen(int index) {
  //   pageController.animateToPage(index,
  //       duration: Duration(milliseconds: 2000), curve: Curves.bounceIn);
  //   selectedScreen = index;
  //   notifyListeners();
  // }
}
