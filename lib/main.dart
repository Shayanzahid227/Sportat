import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:code_structure/ui/booking/booking_view_model.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:code_structure/ui/top_subscription_screen/top_subscription_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/help_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/menu_and_settings.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_bookings/booking_detail.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_bookings/my_booking_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/my_subscription.dart';
import 'package:code_structure/ui/user_profile/my_orders/detail_order.dart';
import 'package:code_structure/ui/user_profile/my_orders/my_orders_screen.dart';
import 'package:code_structure/ui/user_profile/my_orders/track_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => InterestScreenViewModel()),
        ChangeNotifierProvider(create: (context) => TopSubscriptionViewModel()),
        ChangeNotifierProvider(create: (context) => BookingViewModel()),
        ChangeNotifierProvider(create: (context) => RootViewModel(0)),
        ChangeNotifierProvider(create: (_) => SubscriptionViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.sizeOf(context).height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MOR',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: backGroundColor,
                  surfaceTintColor: backGroundColor,
                  shadowColor: backGroundColor,
                  foregroundColor: backGroundColor,
                ),
                scaffoldBackgroundColor: backGroundColor,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
                useMaterial3: true,
              ),
              home: HelpScreen());
        },
      ),
    );
  }
}
