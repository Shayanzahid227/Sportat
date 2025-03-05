import 'dart:async';

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:code_structure/core/model/home_store_categories.dart';
import 'package:code_structure/core/model/home_top_10_fields_model.dart';
import 'package:code_structure/core/model/home_top_subscriptions.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class BookingViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  PageController pageController = PageController();
  PageController top10PageController =
      PageController(viewportFraction: 0.9, initialPage: 1);
  PageController subscriptionPageController =
      PageController(viewportFraction: 0.9, initialPage: 1);
  final ScrollController scrollController = ScrollController();
  final ScrollController storeScrollController = ScrollController();

  HomeViewModel() {
    _startAutoScroll();
    _startStoreAutoScroll();
    _startAutoPageScroll();
    _startAutoSunscriptionPageScroll();
  }

  List<SliderModel> sliders = [
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().locate1,
    ),
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().locate1,
    ),
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().locate1,
    ),
    // Add more slider items here
  ];

  List<LinearGradient> sliderGradients = [
    LinearGradient(
      colors: [Color(0xff81F78E), primaryColor],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [
        Color(0xffFF876E),
        Color(0xffFF3660),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [
        Color(0xff35E0FC),
        Color(0xff34A8FF),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ];

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ///
  ///   home sport categories
  ///
  List<SportCategoriesModel> sportCategoriesList = [
    SportCategoriesModel(
        imageUrl: AppAssets().football1,
        title: 'Football',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().basketball2,
        title: 'Basketball',
        backgroundColor: secondryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().tennis3,
        title: 'Tennis',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().volleyBall4,
        title: 'Volleyball',
        backgroundColor: secondryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().squash5,
        title: 'Squash',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().golf6,
        title: 'Golf',
        backgroundColor: secondryColor),
  ];

  ///
  ///  home top 10 fields
  ///
  int _selectedFieldIndex = 1;
  int get selectedFieldCurrentIndex => _selectedFieldIndex;

  void setCurrentIndexx(int selectedFieldIndex) {
    _selectedFieldIndex = selectedFieldIndex;
    notifyListeners();
  }

  //
  List<HomeTop10FieldsModel> top10FieldsList = [
    HomeTop10FieldsModel(
        imageUrl: AppAssets().top10FieldImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().top10FieldLogo),
    HomeTop10FieldsModel(
        imageUrl: AppAssets().top10FieldImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().top10FieldLogo),
    HomeTop10FieldsModel(
        imageUrl: AppAssets().top10FieldImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().top10FieldLogo)
  ];

  ///
  ///  home top subscriptions  f
  ///
  int _selectedsubscriptionindex = 1;
  int get selectedsubscriptionindex => _selectedsubscriptionindex;

  void setselectedsubscriptionindex(int selectedsubscriptionindex) {
    _selectedsubscriptionindex = selectedsubscriptionindex;
    notifyListeners();
  }

  //
  List<TopSubscriptionsModel> topSubscriptionsList = [
    TopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
    TopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
    TopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
  ];

  ///
  ///  home store categories
  ///
  List<StoreCategoriesModel> storeCategoriesList = [
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories1, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories2, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories3, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories4, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories5, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories6, title: 'Sports Apparel'),
    StoreCategoriesModel(
        imageUrl: AppAssets().storeCategories6, title: 'Sports Apparel'),
  ];

  ///
  /// Automatic scroll
  ///

  ///
  /// Sports Scroll Controller
  ///
  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (scrollController.hasClients) {
        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.offset;
        double nextScroll = currentScroll + 200; // Adjust the scroll speed

        if (nextScroll >= maxScroll) {
          scrollController.animateTo(0,
              duration: Duration(seconds: 2), curve: Curves.easeInOut);
        } else {
          scrollController.animateTo(nextScroll,
              duration: Duration(seconds: 2), curve: Curves.easeInOut);
        }
      }
    });
  }

  ///
  /// Store Scroll Controller
  ///
  void _startStoreAutoScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (storeScrollController.hasClients) {
        double maxScroll = storeScrollController.position.maxScrollExtent;
        double currentScroll = storeScrollController.offset;
        double nextScroll = currentScroll + 200; // Adjust speed

        if (nextScroll >= maxScroll) {
          storeScrollController.animateTo(0,
              duration: Duration(seconds: 3), curve: Curves.easeInOut);
        } else {
          storeScrollController.animateTo(nextScroll,
              duration: Duration(seconds: 3), curve: Curves.easeInOut);
        }
      }
    });
  }

  void _startAutoPageScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (top10PageController.hasClients) {
        int nextPage = _selectedFieldIndex + 1;

        if (nextPage >= top10FieldsList.length) {
          nextPage = 0; // Go back to the first item
        }

        top10PageController.animateToPage(
          nextPage,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
        );

        setCurrentIndexx(nextPage); // Update the selected index
      }
    });
  }

  void _startAutoSunscriptionPageScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (subscriptionPageController.hasClients) {
        int nextPage = _selectedsubscriptionindex + 1;

        if (nextPage >= topSubscriptionsList.length) {
          nextPage = 0; // Go back to the first item
        }

        subscriptionPageController.animateToPage(
          nextPage,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
        );

        setCurrentIndexx(nextPage); // Update the selected index
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    storeScrollController.dispose();
    top10PageController.dispose();
    subscriptionPageController.dispose();
    super.dispose();
  }
}
