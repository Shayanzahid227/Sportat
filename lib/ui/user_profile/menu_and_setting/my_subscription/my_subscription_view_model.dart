import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/my_subscription.dart';

class MySubscriptionViewModel extends BaseViewModel {
  int selectedTabIndex = 0;
  void setSelectedTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  // Sample data for active orders
  final List<MySubscriptionModel> activeBooking = [
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
  ];

  // Sample data for completed orders
  final List<MySubscriptionModel> completedBooking = [
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MySubscriptionModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
  ];

  void trackOrder(MySubscriptionModel order) {
    // Implement your tracking logic here
    print('Tracking order: ${order.title}');
  }

  void showOrderDetails(MySubscriptionModel order) {
    // Implement your details navigation logic here
    print('Showing details for: ${order.title}');
  }
}
