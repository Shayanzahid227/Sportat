import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:code_structure/core/model/home_store_categories.dart';
import 'package:code_structure/core/model/home_top_10_fields_model.dart';
import 'package:code_structure/core/model/home_top_subscriptions.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
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

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ///
  ///   home sport categories
  ///
  List<HomeSportCategoriesModel> sportCategoriesList = [
    HomeSportCategoriesModel(
        imageUrl: AppAssets().football1,
        title: 'Football',
        backgroundColor: PrimaryColor),
    HomeSportCategoriesModel(
        imageUrl: AppAssets().basketball2,
        title: 'Basketball',
        backgroundColor: SecondryColor),
    HomeSportCategoriesModel(
        imageUrl: AppAssets().tennis3,
        title: 'Tennis',
        backgroundColor: PrimaryColor),
    HomeSportCategoriesModel(
        imageUrl: AppAssets().volleyBall4,
        title: 'Volleyball',
        backgroundColor: SecondryColor),
    HomeSportCategoriesModel(
        imageUrl: AppAssets().squash5,
        title: 'Squash',
        backgroundColor: PrimaryColor),
    HomeSportCategoriesModel(
        imageUrl: AppAssets().golf6,
        title: 'Golf',
        backgroundColor: SecondryColor),
  ];

  ///
  ///  home top 10 fields
  ///
  int _selectedFieldIndex = 0;
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
  int _selectedsubscriptionindex = 0;
  int get selectedsubscriptionindex => _selectedsubscriptionindex;

  void setselectedsubscriptionindex(int selectedsubscriptionindex) {
    _selectedsubscriptionindex = selectedsubscriptionindex;
    notifyListeners();
  }

  //
  List<HomeTopSubscriptionsModel> topSubscriptionsList = [
    HomeTopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
    HomeTopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
    HomeTopSubscriptionsModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        title: 'Football for kids',
        fieldLogo: AppAssets().topSubscriptionStadiumLogo),
  ];

  ///
  ///  home store categories
  ///
  List<HomeStoreCategoriesModel> storeCategoriesList = [
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories1, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories2, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories3, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories4, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories5, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories6, title: 'Sports Apparel'),
    HomeStoreCategoriesModel(
        imageUrl: AppAssets().storeCategories6, title: 'Sports Apparel'),
  ];
}
