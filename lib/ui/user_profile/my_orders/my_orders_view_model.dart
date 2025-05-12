import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/user_profile/my_orders/my_orders_screen.dart';

class MyOrdersViewModel extends BaseViewModel {
  int selectedTabIndex = 0;
  void setSelectedTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  // Sample data for active orders
  final List<OrderItem> _activeOrders = [
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Blue', 'Large'],
      trackingStatus: 'Track',
    ),
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Green', 'Medium', 'Extra Item'],
      trackingStatus: 'Track',
    ),
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Red', 'Small'],
      trackingStatus: 'Track',
    ),
  ];

  // Sample data for completed orders
  final List<OrderItem> _completedOrders = [
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Gray', 'Large'],
      trackingStatus: 'Delivered',
    ),
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Dark Blue', 'Medium'],
      trackingStatus: 'Delivered',
    ),
    OrderItem(
      imageUrl: AppAssets().screenStoreCategories1,
      title: 'Men\'s Tie-Dye T-Shirt',
      additionalItems: ['Cyan', 'Small'],
      trackingStatus: 'Delivered',
    ),
  ];

  List<OrderItem> get activeOrders => _activeOrders;
  List<OrderItem> get completedOrders => _completedOrders;

  void trackOrder(OrderItem order) {
    // Implement your tracking logic here
    print('Tracking order: ${order.title}');
  }

  void showOrderDetails(OrderItem order) {
    // Implement your details navigation logic here
    print('Showing details for: ${order.title}');
  }
}
