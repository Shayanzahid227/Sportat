import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/model/club_model.dart';
import 'package:code_structure/core/model/top_subscriptions_screen.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class SubscriptionViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentIndex = 0;

  List<String> images = [
    AppAssets().ground,
    AppAssets().ground,
    AppAssets().ground,
  ];
  List<ClubModel> clubList = [
    ClubModel(id: '1', name: 'Sports Clubs', imgUrl: AppAssets().sportsClub),
    ClubModel(id: '2', name: 'GYM', imgUrl: AppAssets().gym),
    ClubModel(id: '3', name: 'Swimming', imgUrl: AppAssets().swimming),
    ClubModel(id: '4', name: 'Tennis', imgUrl: AppAssets().tennis3),
    ClubModel(id: '5', name: 'Yoga and Pilates', imgUrl: AppAssets().yoga),
    ClubModel(id: '6', name: 'Martial Arts', imgUrl: AppAssets().martialArts),
    ClubModel(
        id: '7',
        name: 'Outdoor Activities',
        imgUrl: AppAssets().outdoorActivities),
    ClubModel(id: '8', name: 'Massage', imgUrl: AppAssets().massage),
    ClubModel(id: '9', name: 'Yoga and Pilates', imgUrl: AppAssets().yoga),
    ClubModel(id: '10', name: 'Martial Arts', imgUrl: AppAssets().martialArts),
  ];

  ///
  ///
  ///
  List<LinearGradient> colorsList = [
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
