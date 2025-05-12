import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/booking/booking_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_bookings/my_booking_screen.dart';

class MyBookingViewModel extends BaseViewModel {
  int selectedTabIndex = 0;
  void setSelectedTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  // Sample data for active orders
  final List<MyBookingModel> activeBooking = [
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
  ];

  // Sample data for completed orders
  final List<MyBookingModel> completedBooking = [
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
    MyBookingModel(
      imageUrl: AppAssets().fieldDetails,
      title: 'Sporting Club',
      trackingStatus: 'Track',
    ),
  ];

  void trackOrder(MyBookingModel order) {
    // Implement your tracking logic here
    print('Tracking order: ${order.title}');
  }

  void showOrderDetails(MyBookingModel order) {
    // Implement your details navigation logic here
    print('Showing details for: ${order.title}');
  }
}
