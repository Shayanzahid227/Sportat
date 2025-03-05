import 'dart:async';

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/core/model/home_store_categories.dart';
import 'package:code_structure/core/model/new_arrivals_model.dart';
import 'package:code_structure/core/model/top_stores_model.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class StoreViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  final ScrollController storeScrollController = ScrollController();

  StoreViewModel() {
    _startStoreAutoScroll();
  }
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

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<NewArrivalsModel> newArrivalsList = [
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'Union BOA Clipless Shoes',
      price: '421',
    ),
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'chemical compounds',
      price: '300',
    ),
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'Union BOA Clipless Shoes',
      price: '500',
    ),
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'chemical compounds',
      price: '250',
    ),
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'Sports Apparel',
      price: '300',
    ),
  ];
  List<SliderModel> sliders = [
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().shirts,
    ),
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().shirts,
    ),
    SliderModel(
      title: 'The first healthy sports',
      highlightedText: 'Community ',
      subText: 'in the world ',
      imageUrl: AppAssets().shirts,
    ),
    // Add more slider items here
  ];

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

  List<TopStoresModel> topStoresList = [
    TopStoresModel(
      imgUrl: AppAssets().pngwing,
    ),
    TopStoresModel(
      imgUrl: AppAssets().pngwing2,
    ),
    TopStoresModel(
      imgUrl: AppAssets().pngwing3,
    ),
    TopStoresModel(
      imgUrl: AppAssets().pngwing4,
    ),
    TopStoresModel(
      imgUrl: AppAssets().pngwing5,
    ),
  ];
}
