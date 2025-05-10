import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/wallet/wallet_view_model.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalletViewModel(),
      child: Consumer<WalletViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: CustomAppBar(
              titleColor: blackColor,
              isBackButton: true,
              title: "Wallet",
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _topSection(),
              _tabSection(model),

              ///
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    model.selectedTabIndex == 0
                        ? Text('history')
                        : model.selectedTabIndex == 1
                            ? Text('deposit')
                            : model.selectedTabIndex == 3
                                ? Text('Transfer energy points')
                                : model.selectedTabIndex == 3
                                    ? Text('cards')
                                    : Text('no data found')
                  ],
                ),
              )),

              ///
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///      top section
  ///
  _topSection() {
    return Column(
      children: [
        20.verticalSpace,
        Center(
          child: Text(
            'Your Balance',
            style: style14.copyWith(color: darkPurpleColor),
          ),
        ),
        10.verticalSpace,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: lightGreyColor),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min, // important for adaptive width
              children: [
                Image.asset(
                  AppAssets().walletIcon,
                  color: primaryColor,
                  scale: 4,
                ),
                10.horizontalSpace,
                Text(
                  '8.250 SAR ',
                  style: style20B.copyWith(color: primaryColor),
                )
              ],
            ),
          ),
        ),
        10.verticalSpace,
        Divider(),
        10.verticalSpace,
        Center(
          child: Text(
            'Your Energy Points',
            style: style14.copyWith(color: darkPurpleColor),
          ),
        ),
        10.verticalSpace,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: lightGreyColor),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min, // important for adaptive width
              children: [
                Image.asset(
                  AppAssets().pointsEarnIcon,
                  scale: 4,
                ),
                10.horizontalSpace,
                Text(
                  '1000 Points',
                  style: style20B.copyWith(color: secondaryColor),
                )
              ],
            ),
          ),
        ),
        10.verticalSpace,
        Divider(),
        10.verticalSpace,
      ],
    );
  }

  ///
  ///       tab section
  ///

  Widget _tabSection(WalletViewModel model) {
    final List<String> titles = ['History', 'Deposit', 'Transfer', 'Cards'];
    final List<Color> colors = [
      lightGreyColor3,
      primaryColor,
      secondaryColor,
      blackColor,
    ];
    final List<String> images = [
      AppAssets().walletIcon,
      AppAssets().walletIcon,
      AppAssets().walletIcon,
      AppAssets().walletIcon,
    ];
    final List<String?> subtitles = [
      null,
      null,
      'Energy points',
      null,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(titles.length, (index) {
          return GestureDetector(
            onTap: () => model.setSelectedTabIndex(index),
            child: _customTabMethod(
              backgroundColor: colors[index],
              imagePath: images[index],
              title: titles[index],
              subtitle: subtitles[index],
            ),
          );
        }),
      ),
    );
  }

  ///
  ///      custom selectable tab
  ///
  Widget _customTabMethod({
    required Color backgroundColor,
    required String imagePath,
    required String title,
    String? subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              scale: 4,
              color: whiteColor,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),
        10.verticalSpace,
        Text(
          title,
          style: style12.copyWith(color: lightGreyColor),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: style12.copyWith(
              color: lightGreyColor,
            ),
          ),
      ],
    );
  }
}
