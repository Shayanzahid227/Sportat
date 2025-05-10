import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/new_arrivals_model.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class MyWishListViewModel extends BaseViewModel {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  List<NewArrivalsModel> newArrivalsList = [
    NewArrivalsModel(
      imageUrl: AppAssets().arrivals1,
      title: 'Union BOA Clipless Shoes',
      price: '421',
    ),
    NewArrivalsModel(
      imageUrl: AppAssets().screenStoreCategories1,
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
    NewArrivalsModel(
      imageUrl: AppAssets().screenStoreCategories1,
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
}
