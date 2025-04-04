import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:code_structure/ui/root_screen/root_screen.dart';
import 'package:code_structure/ui/top_subscription_screen/top_subscription_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.sizeOf(context).height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sportat',
            theme: ThemeData(
              scaffoldBackgroundColor: backGroundColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
            home: RootScreen(),
          );
        },
      ),
    );
  }
}
