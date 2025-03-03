import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(selectedScreen),
      child: Consumer<RootViewModel>(
        builder: (context, model, child) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,

          ///
          /// Start Body
          ///
          body: model.allScreen[model.selectedScreen],

          ///
          /// BottomBar
          ///
          bottomNavigationBar: ConvexAppBar(
            height: 100,
            backgroundColor: whitecolor,
            activeColor: primaryColor,
            color: lightGreyColor,

            style:
                TabStyle.custom, // Change this to fixed so text always appears
            initialActiveIndex: model.selectedScreen,
            // disableDefaultTabController: true,
            onTap: (index) {
              model.updatedScreen(index);
            },
            items: [
              TabItem(
                  icon: Image.asset(
                    AppAssets().booking,
                    color:
                        model.selectedScreen == 0 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Booking'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().subscribe,
                    color:
                        model.selectedScreen == 1 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Subscribe'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().home,
                    color:
                        model.selectedScreen == 2 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Home'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().store,
                    color:
                        model.selectedScreen == 3 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Store'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().timeline,
                    color:
                        model.selectedScreen == 4 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Timeline'),
            ],
          ),

          ///
          /// Right Drawer
          ///
          // endDrawer: buildDrawer(context),
        ),
      ),
    );
  }
}
