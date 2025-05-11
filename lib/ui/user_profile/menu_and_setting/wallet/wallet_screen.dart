import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/wallet/wallet_view_model.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
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
              _topSection(context),
              _tabSection(model),

              ///
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        model.selectedTabIndex == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text('History'),
                                  ),
                                  ListView.builder(
                                    itemCount: model.TransactionList.length,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomTransactionTile(
                                        isCredit: model
                                            .TransactionList[index].isCredit,
                                        transaction:
                                            model.TransactionList[index],
                                      );
                                    },
                                  ),
                                ],
                              )
                            : model.selectedTabIndex == 2
                                ? Text('transfer energy points')
                                : model.selectedTabIndex == 3
                                    ? Text('cards')
                                    : Text('Get to deposit screen')
                      ],
                    ),
                  ),
                ),
              ),

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
  _topSection(BuildContext context) {
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
          decoration: DottedDecoration(
            shape: Shape.box,
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
          decoration: DottedDecoration(
            shape: Shape.box,
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
        //     what is energy points
        GestureDetector(
          onTap: () {
            _showEnergyPointsDialog(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.help,
                color: darkGreyColor,
              ),
              5.horizontalSpace,
              Text(
                'What is energy points',
                style: style12.copyWith(color: blackColor),
              )
            ],
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
      AppAssets().historyIcon,
      AppAssets().depositIcon,
      AppAssets().arrowRightIcon,
      AppAssets().cardsIcon,
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

  ///
  ///      dialogue box
  ///

  void _showEnergyPointsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    AppAssets().pointsEarnedIcon,
                    scale: 4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'What Is Energy Points?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Energy Points Are Rewards You Earn With Every Booking Through The Sportat App. These Points Can Be Accumulated And Redeemed For Discounts On Future Bookings Or Purchases In Our Sports Store. They Encourage You To Stay Active And Make The Most Of Your Sports Experience While Enjoying Added Benefits!',
                style: TextStyle(fontSize: 16, color: darkGreyColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomButton(
                  text: 'Ok',
                  onPressed: () {
                    navigator?.pop(context);
                  })
            ],
          ),
        );
      },
    );
  }
}

///
///       custom transaction list tile
///
class CustomTransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final bool isCredit;

  const CustomTransactionTile({
    super.key,
    required this.transaction,
    this.isCredit = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 42.h,
        width: 42.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCredit ? primaryColor.withOpacity(0.2) : Colors.red.shade100,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            isCredit ? AppAssets().arrowRightIcon : AppAssets().blueTickIcon,
            color: isCredit ? primaryColor : pinkColor,
          ),
        ),
      ),
      title: Text(transaction.title, style: style14.copyWith()),
      subtitle: Text(
        transaction.subtitle,
        style: style12.copyWith(color: lightGreyColor),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${isCredit ? '+' : '-'}${transaction.amount}',
            style: style14.copyWith(
                color: isCredit ? Colors.green : Colors.red, fontSize: 13),
          ),
          Text(
            DateFormat('MMM d').format(transaction.date),
            style: style12.copyWith(color: lightGreyColor),
          ),
        ],
      ),
    );
  }
}

///
///     transaction model
///
class TransactionModel {
  final String title;
  final String subtitle;
  final double amount;
  final DateTime date;
  final bool isCredit;

  TransactionModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    this.isCredit = false,
  });
}
///
///
///