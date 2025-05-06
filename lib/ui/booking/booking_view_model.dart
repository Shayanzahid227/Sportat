import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:code_structure/core/model/top_subscriptions_screen.dart'
    show TopSubscriptions;
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class BookingViewModel extends BaseViewModel {
  List<SportCategoriesModel> sportCategoriesList = [
    SportCategoriesModel(
        imageUrl: AppAssets().football1,
        title: 'Football',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().basketball2,
        title: 'Basketball',
        backgroundColor: secondaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().tennis3,
        title: 'Tennis',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().volleyBall4,
        title: 'Volleyball',
        backgroundColor: secondaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().squash5,
        title: 'Squash',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().golf6,
        title: 'Golf',
        backgroundColor: secondaryColor),
  ];
  List<LinearGradient> sliderGradients = [
    LinearGradient(
      colors: [lightGreenColor, primaryColor],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [
        lightOrangeColor,
        pinkColor2,
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [skyBlueColor, blueColor],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ];
  //***************************************************************************************/
  ///      booking field screen data
  ///
  List<TopSubscriptions> bookingFieldList = [
    TopSubscriptions(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPoints: '100 energy points',
        location: 'Riyadh Area'),
    TopSubscriptions(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPoints: '100 energy points',
        location: 'Riyadh Area'),
    TopSubscriptions(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPoints: '100 energy points',
        location: 'Riyadh Area'),
    TopSubscriptions(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPoints: '100 energy points',
        location: 'Riyadh Area'),
  ];
}
